#!/bin/bash
set -e

REPO="roodyzain75/udp-zivpn"
BRANCH="main"

echo "🔄 Updating UDP ZIVPN PRO++..."

cd /tmp

# download file utama
wget -q -O zi.sh https://raw.githubusercontent.com/$REPO/$BRANCH/zi.sh
wget -q -O install.sh https://raw.githubusercontent.com/$REPO/$BRANCH/install.sh
wget -q -O config.conf https://raw.githubusercontent.com/$REPO/$BRANCH/config.conf

# download folder bin
mkdir -p bin bot service

for f in udp-add udp-del udp-list udp-trial udp-exp udp-renew; do
  wget -q -O bin/$f https://raw.githubusercontent.com/$REPO/$BRANCH/bin/$f
done

# bot
wget -q -O bot/bot.py https://raw.githubusercontent.com/$REPO/$BRANCH/bot/bot.py

# service
wget -q -O service/udp-zivpn.service https://raw.githubusercontent.com/$REPO/$BRANCH/service/udp-zivpn.service
wget -q -O service/udp-bot.service https://raw.githubusercontent.com/$REPO/$BRANCH/service/udp-bot.service

# install ke system
chmod +x zi.sh install.sh bin/*
cp zi.sh /usr/local/bin/
cp install.sh /usr/local/bin/
cp config.conf /etc/udp-zivpn/
cp bin/* /usr/local/bin/
cp bot/bot.py /etc/udp-zivpn/
cp service/*.service /etc/systemd/system/

systemctl daemon-reload
systemctl restart udp-zivpn udp-bot

echo "✅ Update selesai"

