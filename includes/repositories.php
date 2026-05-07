<?php

declare(strict_types=1);

function get_kitchen_categories(): array
{
    return db_all(
        'SELECT id, name, slug FROM restaurant_categories
         WHERE is_active = 1
         ORDER BY name ASC'
    );
}

function get_restaurants(array $filters = []): array
{
    $where = ['r.is_active = 1'];
    $params = [];

    if (!empty($filters['search'])) {
        $where[] = '(
            r.name LIKE :search_restaurant_name
            OR r.short_description LIKE :search_restaurant_description
            OR EXISTS (
                SELECT 1
                FROM restaurant_category_links rcl_search
                JOIN restaurant_categories rc_search ON rc_search.id = rcl_search.category_id
                WHERE rcl_search.restaurant_id = r.id
                  AND rc_search.is_active = 1
                  AND rc_search.name LIKE :search_kitchen_category
            )
            OR EXISTS (
                SELECT 1
                FROM menu_items mi
                LEFT JOIN menu_categories mc_search ON mc_search.id = mi.category_id
                WHERE mi.restaurant_id = r.id
                  AND mi.is_available = 1
                  AND (
                      mi.name LIKE :search_menu_item_name
                      OR mi.description LIKE :search_menu_item_description
                      OR mc_search.name LIKE :search_menu_category
                  )
            )
        )';
        $searchTerm = '%' . trim((string) $filters['search']) . '%';
        $params['search_restaurant_name'] = $searchTerm;
        $params['search_restaurant_description'] = $searchTerm;
        $params['search_kitchen_category'] = $searchTerm;
        $params['search_menu_item_name'] = $searchTerm;
        $params['search_menu_item_description'] = $searchTerm;
        $params['search_menu_category'] = $searchTerm;
    }

    if (!empty($filters['category_id'])) {
        $where[] = 'EXISTS (
            SELECT 1 FROM restaurant_category_links f
            WHERE f.restaurant_id = r.id AND f.category_id = :category_id
        )';
        $params['category_id'] = (int) $filters['category_id'];
    }

    if (!empty($filters['min_rating'])) {
        $where[] = 'r.rating >= :min_rating';
        $params['min_rating'] = (float) $filters['min_rating'];
    }

    if (!empty($filters['max_delivery_fee'])) {
        $where[] = 'r.delivery_fee <= :max_delivery_fee';
        $params['max_delivery_fee'] = (float) $filters['max_delivery_fee'];
    }

    if (!empty($filters['max_delivery_time'])) {
        $where[] = 'r.delivery_time_max <= :max_delivery_time';
        $params['max_delivery_time'] = (int) $filters['max_delivery_time'];
    }

    if (!empty($filters['max_min_order'])) {
        $where[] = 'r.min_order_amount <= :max_min_order';
        $params['max_min_order'] = (float) $filters['max_min_order'];
    }

    if (!empty($filters['has_hits'])) {
        $where[] = 'EXISTS (
            SELECT 1
            FROM menu_items mi_hits
            WHERE mi_hits.restaurant_id = r.id
              AND mi_hits.is_available = 1
              AND (mi_hits.is_new = 1 OR mi_hits.is_popular = 1)
        )';
    }

    if (!empty($filters['menu_category'])) {
        $rawMenuCategories = trim((string) $filters['menu_category']);
        $menuCategoryTerms = preg_split('/[|,]+/u', $rawMenuCategories) ?: [];
        $menuCategoryTerms = array_values(array_filter(array_map('trim', $menuCategoryTerms)));

        if ($menuCategoryTerms) {
            $menuCategoryWhere = [];
            foreach ($menuCategoryTerms as $index => $term) {
                $paramName = 'menu_category_' . $index;
                $menuCategoryWhere[] = 'mc_filter.name LIKE :' . $paramName;
                $params[$paramName] = '%' . $term . '%';
            }

            $where[] = 'EXISTS (
                SELECT 1
                FROM menu_items mi_filter
                JOIN menu_categories mc_filter ON mc_filter.id = mi_filter.category_id
                WHERE mi_filter.restaurant_id = r.id
                  AND mi_filter.is_available = 1
                  AND mc_filter.is_active = 1
                  AND (' . implode(' OR ', $menuCategoryWhere) . ')
            )';
        }
    }

    $sort = (string) ($filters['sort'] ?? 'rating_desc');
    $orderBy = 'r.rating DESC, r.created_at DESC';
    if ($sort === 'delivery_fast') {
        $orderBy = 'r.delivery_time_max ASC, r.rating DESC';
    } elseif ($sort === 'newest') {
        $orderBy = 'r.created_at DESC, r.rating DESC';
    } elseif ($sort === 'min_order_asc') {
        $orderBy = 'r.min_order_amount ASC, r.rating DESC';
    }

    $sql = 'SELECT r.*,
                   GROUP_CONCAT(rc.name ORDER BY rc.name SEPARATOR ", ") AS category_names
            FROM restaurants r
            LEFT JOIN restaurant_category_links rcl ON rcl.restaurant_id = r.id
            LEFT JOIN restaurant_categories rc ON rc.id = rcl.category_id
            WHERE ' . implode(' AND ', $where) . '
            GROUP BY r.id
            ORDER BY ' . $orderBy;

    return db_all($sql, $params);
}

function get_restaurant_by_id(int $id): ?array
{
    $restaurant = db_one(
        'SELECT r.*,
                GROUP_CONCAT(rc.name ORDER BY rc.name SEPARATOR ", ") AS category_names
         FROM restaurants r
         LEFT JOIN restaurant_category_links rcl ON rcl.restaurant_id = r.id
         LEFT JOIN restaurant_categories rc ON rc.id = rcl.category_id
         WHERE r.id = :id AND r.is_active = 1
         GROUP BY r.id',
        ['id' => $id]
    );

    if (!$restaurant) {
        return null;
    }

    $restaurant['menu_categories'] = db_all(
        'SELECT mc.id, mc.name, mc.sort_order
         FROM menu_categories mc
         WHERE mc.restaurant_id = :restaurant_id AND mc.is_active = 1
         ORDER BY mc.sort_order ASC, mc.id ASC',
        ['restaurant_id' => $id]
    );

    $restaurant['menu_items'] = db_all(
        'SELECT mi.*
         FROM menu_items mi
         JOIN menu_categories mc ON mc.id = mi.category_id
         WHERE mi.restaurant_id = :restaurant_id
           AND mi.is_available = 1
           AND mc.is_active = 1
         ORDER BY mc.sort_order ASC, mi.is_popular DESC, mi.id DESC',
        ['restaurant_id' => $id]
    );

    $restaurant['reviews'] = db_all(
        'SELECT rv.rating, rv.comment, rv.created_at, u.name AS user_name
         FROM reviews rv
         JOIN users u ON u.id = rv.user_id
         WHERE rv.restaurant_id = :restaurant_id AND rv.is_approved = 1
         ORDER BY rv.created_at DESC
         LIMIT 8',
        ['restaurant_id' => $id]
    );

    return $restaurant;
}

function get_user_favorites(int $userId): array
{
    return db_all(
        'SELECT r.*
         FROM favorites f
         JOIN restaurants r ON r.id = f.restaurant_id
         WHERE f.user_id = :user_id AND r.is_active = 1
         ORDER BY f.created_at DESC',
        ['user_id' => $userId]
    );
}

function toggle_favorite(int $userId, int $restaurantId): bool
{
    $exists = db_one(
        'SELECT id FROM favorites WHERE user_id = :user_id AND restaurant_id = :restaurant_id LIMIT 1',
        ['user_id' => $userId, 'restaurant_id' => $restaurantId]
    );

    if ($exists) {
        db_exec('DELETE FROM favorites WHERE id = :id', ['id' => $exists['id']]);
        return false;
    }

    db_exec(
        'INSERT INTO favorites (user_id, restaurant_id, created_at)
         VALUES (:user_id, :restaurant_id, :created_at)',
        ['user_id' => $userId, 'restaurant_id' => $restaurantId, 'created_at' => now()]
    );
    return true;
}

function is_favorite(int $userId, int $restaurantId): bool
{
    $row = db_one(
        'SELECT id FROM favorites WHERE user_id = :user_id AND restaurant_id = :restaurant_id LIMIT 1',
        ['user_id' => $userId, 'restaurant_id' => $restaurantId]
    );
    return $row !== null;
}
