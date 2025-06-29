#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : NevermoreSSH
# (C) Copyright 2022
# =========================================

red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
clear
IP=$(wget -qO- icanhazip.com);
date=$(date +"%Y-%m-%d-%H:%M:%S")
domain=$(cat /usr/local/etc/xray/domain)
clear
echo " VPS Data Backup By NevermoreSSH "
sleep 1
echo -e "[ ${green}INFO${NC} ] Processing . . . "
mkdir -p /root/backup
sleep 1
clear
echo " Please Wait VPS Data Backup In Progress . . . "
echo " "
echo " Backup SSH Account . . . "
cp -r /etc/passwd /root/backup/passwd
cp -r /etc/group /root/backup/group
cp -r /etc/shadow /root/backup/shadow
cp -r /etc/gshadow /root/backup/gshadow
echo " Backup WireGuard n Openvpn Account . . . "
cp -r /etc/wireguard /root/backup/wireguard
cp -r /etc/openvpn /root/backup/openvpn
echo " Backup ShadowSocks Account . . . "
cp -r /etc/shadowsocks-libev/akun.conf /root/backup/ss.conf
cp -r /var/lib/premium-script/ /root/backup/premium-script
echo " Backup XRAY Account . . . "
cp -r /usr/local/etc/xray /root/backup/xray
cp -r /etc/trojan-go /root/backup/trojan-go
cp -r /usr/local/shadowsocksr/ /root/backup/shadowsocksr
cp -r /etc/crontab /root/backup/crontab
cp -r /home/vps/public_html /root/backup/public_html
cd /root
zip -r $IP-$date-$domain-vinnfier.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date-$domain-vinnfier.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date-$domain-vinnfier.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
clear
echo -e "\033[1;37mVPS Data Backup By NevermoreSSH\033[0m
\033[1;37mTelegram : https://t.me/todfix667 / @NevermoreSSH\033[0m"
echo ""
echo "Please Copy Link Below & Save In Notepad"
echo ""
echo -e "Your VPS IP ( \033[1;37m$IP\033[0m )"
echo ""
echo -e "\033[1;37m$link\033[0m"
echo ""
echo "If you want to restore data, please enter the link above"
rm -rf /root/backup
rm -r /root/$IP-$date-$domain-vinnfier.zip
echo ""
