<?php

declare(strict_types=1);

function mealgo_email_template(string $title, string $contentHtml, ?array $button = null, string $footerText = ''): string
{
    $contentHtml = str_replace(
        ['color:#6f685f;', 'color:#2f2d2a;', 'background:#f4f1ea;', 'border:1px solid #ddd5c8;'],
        ['color:#c7c7c7;', 'color:#f5f5f5;', 'background:#ffffff;', 'border:1px solid #ffffff;'],
        $contentHtml
    );

    $buttonHtml = '';
    if ($button) {
        $buttonHtml = '<p style="margin:26px 0 0;">'
            . '<a href="' . e((string) $button['url']) . '" style="display:inline-block;padding:15px 24px;border-radius:14px;background:#ffffff;color:#111111;text-decoration:none;font-size:16px;font-weight:900;">'
            . e((string) $button['label'])
            . '</a>'
            . '</p>';
    }

    $footerHtml = $footerText !== ''
        ? '<p style="margin:22px 0 0;font-size:13px;line-height:1.45;color:#a8a8a8;">' . e($footerText) . '</p>'
        : '';

    return '<div style="margin:0;padding:32px;background:#ffffff;font-family:Arial,Helvetica,sans-serif;color:#ffffff;">'
        . '<div style="max-width:580px;margin:0 auto;border:1px solid #2d3035;border-radius:24px;background:#111417;overflow:hidden;box-shadow:0 18px 50px rgba(20,20,20,.16);">'
        . '<div style="padding:30px 30px 26px;">'
        . '<div style="font-size:24px;font-weight:900;letter-spacing:.04em;text-transform:uppercase;margin-bottom:28px;color:#ffffff;">MEALGO</div>'
        . '<h1 style="margin:0 0 16px;font-size:34px;line-height:1.05;font-weight:900;color:#ffffff;">' . e($title) . '</h1>'
        . '<div style="font-size:16px;line-height:1.58;color:#f5f5f5;">' . $contentHtml . '</div>'
        . $buttonHtml
        . $footerHtml
        . '</div>'
        . '</div>'
        . '</div>';
}

function send_email(string $to, string $subject, string $htmlBody, ?string $textBody = null): bool
{
    $mailCfg = app_config('mail');
    if (($mailCfg['driver'] ?? 'smtp') === 'log') {
        app_log('mail', [
            'to' => $to,
            'subject' => $subject,
            'html' => $htmlBody,
            'text' => $textBody,
        ]);
        return true;
    }

    return smtp_send(
        (string) $mailCfg['smtp_host'],
        (int) $mailCfg['smtp_port'],
        (string) $mailCfg['from_email'],
        (string) $mailCfg['from_name'],
        $to,
        $subject,
        $htmlBody,
        $textBody
    );
}

function smtp_send(
    string $host,
    int $port,
    string $fromEmail,
    string $fromName,
    string $toEmail,
    string $subject,
    string $htmlBody,
    ?string $textBody = null
): bool {
    $socket = @stream_socket_client("tcp://{$host}:{$port}", $errno, $errstr, 10);
    if (!$socket) {
        app_log('mail_error', ['error' => $errstr, 'code' => $errno]);
        return false;
    }

    stream_set_timeout($socket, 10);

    $read = static function ($sock): string {
        $response = '';
        while (($line = fgets($sock, 515)) !== false) {
            $response .= $line;
            if (strlen($line) < 4 || $line[3] !== '-') {
                break;
            }
        }
        return $response;
    };

    $write = static function ($sock, string $cmd): void {
        fwrite($sock, $cmd . "\r\n");
    };

    $expect = static function (string $response, array $codes): bool {
        foreach ($codes as $code) {
            if (str_starts_with($response, (string) $code)) {
                return true;
            }
        }
        return false;
    };

    $response = $read($socket);
    if (!$expect($response, [220])) {
        fclose($socket);
        return false;
    }

    $write($socket, 'HELO localhost');
    if (!$expect($read($socket), [250])) {
        fclose($socket);
        return false;
    }

    $write($socket, 'MAIL FROM:<' . $fromEmail . '>');
    if (!$expect($read($socket), [250])) {
        fclose($socket);
        return false;
    }

    $write($socket, 'RCPT TO:<' . $toEmail . '>');
    if (!$expect($read($socket), [250])) {
        fclose($socket);
        return false;
    }

    $write($socket, 'DATA');
    if (!$expect($read($socket), [354])) {
        fclose($socket);
        return false;
    }

    $boundary = 'b' . bin2hex(random_bytes(8));
    $fromHeader = mb_encode_mimeheader($fromName, 'UTF-8') . " <{$fromEmail}>";
    $subjectHeader = mb_encode_mimeheader($subject, 'UTF-8');
    $textBody = $textBody ?? strip_tags($htmlBody);

    $message = [];
    $message[] = "From: {$fromHeader}";
    $message[] = "To: <{$toEmail}>";
    $message[] = "Subject: {$subjectHeader}";
    $message[] = 'MIME-Version: 1.0';
    $message[] = "Content-Type: multipart/alternative; boundary=\"{$boundary}\"";
    $message[] = '';
    $message[] = "--{$boundary}";
    $message[] = 'Content-Type: text/plain; charset=UTF-8';
    $message[] = 'Content-Transfer-Encoding: 8bit';
    $message[] = '';
    $message[] = $textBody;
    $message[] = "--{$boundary}";
    $message[] = 'Content-Type: text/html; charset=UTF-8';
    $message[] = 'Content-Transfer-Encoding: 8bit';
    $message[] = '';
    $message[] = $htmlBody;
    $message[] = "--{$boundary}--";
    $message[] = '.';

    fwrite($socket, implode("\r\n", $message) . "\r\n");
    if (!$expect($read($socket), [250])) {
        fclose($socket);
        return false;
    }

    $write($socket, 'QUIT');
    $read($socket);
    fclose($socket);
    return true;
}
