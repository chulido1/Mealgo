    </main>

    <?php
    $drawerPayload = auth_check() ? get_active_carts_payload((int) current_user()['id']) : ['cart_count' => 0, 'carts' => []];
    $drawerCarts = $drawerPayload['carts'];
    ?>
    <aside class="cart-drawer" data-cart-drawer>
        <div class="cart-drawer__header">
            <h3>Активные корзины</h3>
            <button type="button" data-cart-close>&times;</button>
        </div>
        <div
            class="cart-drawer__body"
            data-cart-list
            data-cart-clear-url="<?= e(base_url('/api/cart_clear.php')) ?>"
            data-cart-csrf="<?= e(csrf_token()) ?>"
        >
            <?php if (!auth_check()): ?>
                <p class="muted">Войдите, чтобы пользоваться корзинами.</p>
            <?php elseif (!$drawerCarts): ?>
                <p class="muted">Пока нет активных корзин.</p>
            <?php else: ?>
                <?php foreach ($drawerCarts as $cart): ?>
                    <article class="cart-mini-card">
                        <h4><?= e($cart['restaurant_name']) ?></h4>
                        <p><?= (int) $cart['items_count'] ?> поз. &bull; <?= number_format((float) $cart['subtotal'], 0, '.', ' ') ?> &#8381;</p>
                        <?php if (!empty($cart['items'])): ?>
                            <ul class="cart-mini-card__items">
                                <?php foreach ($cart['items'] as $item): ?>
                                    <li>
                                        <span><?= e($item['name']) ?></span>
                                        <strong>&times;<?= (int) $item['quantity'] ?></strong>
                                    </li>
                                <?php endforeach; ?>
                            </ul>
                        <?php endif; ?>
                        <div class="cart-mini-card__actions">
                            <button class="btn btn-ghost" type="button" data-cart-clear data-cart-id="<?= (int) $cart['id'] ?>">Удалить</button>
                            <a class="btn btn-primary" href="<?= e((string) $cart['details_url']) ?>">Подробнее</a>
                        </div>
                    </article>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
    </aside>
    <div class="drawer-backdrop" data-cart-backdrop></div>

    <?php
    $footerRedirect = (string) ($_SERVER['REQUEST_URI'] ?? base_url('/index.php'));
    $footerRedirect .= str_contains($footerRedirect, '#') ? '' : '#footer-subscribe';
    ?>
    <footer class="mono-footer" id="footer-subscribe">
        <div class="container mono-footer-grid">
            <h3>MEALGO</h3>
            <div>
                <strong>Разделы</strong>
                <a href="<?= e(base_url('/restaurants.php')) ?>">Рестораны</a>
                <a href="<?= e(base_url('/favorites.php')) ?>">Избранное</a>
                <a href="<?= e(base_url('/orders.php')) ?>">Заказы</a>
                <a href="<?= e(base_url('/profile.php')) ?>">Профиль</a>
            </div>
            <div>
                <strong>Мы в соцсетях</strong>
                <a href="#">ВКонтакте</a>
                <a href="#">Телеграм</a>
            </div>
            <form action="<?= e(base_url('/newsletter_subscribe.php')) ?>" method="post" class="mono-subscribe">
                <?= csrf_field() ?>
                <input type="hidden" name="_redirect" value="<?= e($footerRedirect) ?>">
                <p>Подпишитесь по эл. почте, чтобы получать новости и обновления.</p>
                <div>
                    <input type="email" name="email" placeholder="Эл. почта" value="<?= e(old('newsletter_email')) ?>" required>
                    <button type="submit">ПОДПИСАТЬСЯ</button>
                </div>
            </form>
        </div>
    </footer>
</div>

<?php $scriptVersion = (string) @filemtime(ROOT_PATH . '/public/assets/js/app.js'); ?>
<script src="<?= e(base_url('/assets/js/app.js?v=' . $scriptVersion)) ?>" defer></script>
</body>
</html>
