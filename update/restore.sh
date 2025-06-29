#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : NevermoreSSH
# (C) Copyright 2022
# =========================================
# PROVIDED
creditt=$(cat /root/provided)
# BANNER COLOUR
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)

red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
clear
echo ""
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text            \e[30m[\e[$box RESTORE SSH & XRAY ACCOUNT \e[30m ]\e[1m            \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo ""
echo " This Feature Can Only Be Used According To VPS Data With This Autoscript"
echo " Please Insert VPS Data Backup Link To Restore The Data"
echo ""
#read -rp " Password File: " -e InputPass
read -rp " Link File: " -e url
wget -O backup.zip "$url"
#unzip -P $InputPass /root/backup.zip &> /dev/null
unzip backup.zip
rm -f backup.zip
sleep 1
echo -e "[ ${green}INFO${NC} ] Start Restore . . . "
#cd /root/backup
cp -r /root/backup/passwd /etc/
cp -r /root/backup/group /etc/
cp -r /root/backup/shadow /etc/
cp -r /root/backup/gshadow /etc/
cp -r /root/backup/wireguard /etc/
cp -r /root/backup/openvpn /etc/
cp -r /root/backup/ss.conf /etc/shadowsocks-libev/ss.conf
cp -r /root/backup/premium-script /var/lib/
cp -r /root/backup/xray /usr/local/etc/
cp -r /root/backup/trojan-go /etc/
cp -r /root/backup/shadowsocksr /usr/local/
cp -r /root/backup/public_html /home/vps/
cp /root/backup/crontab /etc/
rm -f backup.zip
echo ""
echo -e "[ ${green}INFO${NC} ] VPS Data Restore Complete, Please restart / reboot first !"
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
system
