#!/bin/bash
apt update -y
apt install -y socat screen python3-pip curl
pip3 install pyTelegramBotAPI

mkdir -p /etc/udp-zivpn
mkdir -p /usr/local/bin

cp bin/* /usr/local/bin/
chmod +x /usr/local/bin/*

cp bot/bot.py /etc/udp-zivpn/
cp service/*.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable udp-zivpn udp-bot
systemctl start udp-zivpn udp-bot

echo "UDP ZIVPN PRO++ LEVEL 3 AKTIF"
if [[ "$LICENSE_KEY" != "ZIVPN-ROODY-2026" ]]; then
  echo "LICENSE INVALID"
  exit 1
fi

