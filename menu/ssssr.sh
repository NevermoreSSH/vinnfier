#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="NevermoreSSH"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
MYIP=$(curl -s ipinfo.io/ip )
MYIP=$(curl -sS ipv4.icanhazip.com)
MYIP=$(curl -sS ifconfig.me )
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo -e ""
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text          \e[30m═[\e[$box SSR & SS Account\e[30m] ═          \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "    \e[$number (1)\e[m \e[$below Create ShadowsocksR Account\e[m"
echo -e "    \e[$number (2)\e[m \e[$below Create Shadowsocks Account\e[m"
echo -e "    \e[$number (3)\e[m \e[$below Deleting ShadowsocksR Account\e[m"
echo -e "    \e[$number (4)\e[m \e[$below Delete Shadowsocks Account\e[m"
echo -e "    \e[$number (5)\e[m \e[$below Renew ShadowsocksR Account\e[m"
echo -e "    \e[$number (6)\e[m \e[$below Renew Shadowsocks Account\e[m"
echo -e "    \e[$number (7)\e[m \e[$below Check User Login Shadowsocks\e[m"
echo -e "    \e[$number (8)\e[m \e[$below Show Other ShadowsocksR Menu\e[m"
echo -e ""
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text \e[$box x)  MENU                                \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "\e[$line"
read -p "        Please Input Number  [1-8 or x] :  "  ssssr
echo -e ""
case $ssssr in
1)
add-ssr
;;
2)
add-ss
;;
3)
del-ssr
;;
4)
del-ss
;;
5)
renew-ssr
;;
6)
renew-ss
;;
7)
cek-ss
;;
8)
ssr
;;
x)
menu
;;
*)
echo "Please enter an correct number"
;;
esac
