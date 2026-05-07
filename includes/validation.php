<?php

declare(strict_types=1);

function validate(array $rules, array $input): array
{
    $errors = [];

    foreach ($rules as $field => $ruleSet) {
        $value = trim((string) ($input[$field] ?? ''));
        foreach ($ruleSet as $rule) {
            if ($rule === 'required' && $value === '') {
                $errors[$field] = 'Поле обязательно.';
                break;
            }
            if (str_starts_with($rule, 'min:')) {
                $min = (int) substr($rule, 4);
                if (mb_strlen($value) < $min) {
                    $errors[$field] = "Минимум {$min} символов.";
                    break;
                }
            }
            if ($rule === 'email' && $value !== '' && !filter_var($value, FILTER_VALIDATE_EMAIL)) {
                $errors[$field] = 'Некорректный email.';
                break;
            }
            if ($rule === 'numeric' && $value !== '' && !is_numeric($value)) {
                $errors[$field] = 'Требуется числовое значение.';
                break;
            }
            if ($rule === 'password_strong' && $value !== '') {
                if (!preg_match('/\p{Lu}/u', $value) || !preg_match('/[^\p{L}\p{N}\s]/u', $value)) {
                    $errors[$field] = 'Пароль должен содержать минимум 8 символов, заглавную букву и спецсимвол.';
                    break;
                }
            }
        }
    }

    return $errors;
}
