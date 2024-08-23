#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="NevermoreSSH"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
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
clear
echo -e ""
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$back_text             \e[30m═[\e[$box SYSTEM MENU\e[30m ]═          \e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$number (•1)\e[m \e[$below Add New Subdomain\e[m"
echo -e "   \e[$number (•2)\e[m \e[$below Renew Cert Xray Core\e[m"
echo -e "   \e[$number (•3)\e[m \e[$below Panel Domain\e[m"
echo -e "   \e[$number (•4)\e[m \e[$below Backup Vps\e[m"
echo -e "   \e[$number (•5)\e[m \e[$below Restore Vps\e[m"
echo -e "   \e[$number (•6)\e[m \e[$below Install Webmin\e[m"
echo -e "   \e[$number (•7)\e[m \e[$below Setup Speed VPS\e[m"
echo -e "   \e[$number (•8)\e[m \e[$below Restart VPN\e[m"
echo -e "   \e[$number (•9)\e[m \e[$below Speedtest VPS\e[m"
echo -e "   \e[$number (10)\e[m \e[$below Install BBR\e[m"
echo -e "   \e[$number (11)\e[m \e[$below ON/OF Auto Reboot\e[m"
echo -e "   \e[$number (12)\e[m \e[$below Change Password VPS\e[m"
echo -e "   \e[$number (13)\e[m \e[$below DNS Changer \e[m"
echo -e "   \e[$number (14)\e[m \e[$below Netflix Checker \e[m"
echo -e "   \e[$number (15)\e[m \e[$below Install Adblock \e[m"
echo -e "   \e[$number (16)\e[m \e[$below Panel Adblock \e[m"
echo -e "   \e[$number (17)\e[m \e[$below Change BannerSSH \e[m"
echo -e "   \e[$number (18)\e[m \e[$below SwapRAM Menu \e[m"
echo -e ""
#echo -e "   \e[$number (66)\e[m \e[$below Install SlowDNS\e[m"
#echo -e "   \e[$number (77)\e[m \e[$below Install UDP Custom\e[m"
echo -e "   \e[$number (77)\e[m \e[$below Xray-core Changer\e[m"
echo -e "   \e[$number (88)\e[m \e[$below Xray-core Changer\e[m"
echo -e "   \e[$number (99)\e[m \e[$below Update menu VPS\e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$back_text \e[$box x)   MENU                             \e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "\e[$line"
read -p "        Please Input Number  [1-99 or x] :  "  sys
echo -e ""
case $sys in
1)
add-host
;;
2)
certv2ray
;;
3)
panel-domain
;;
4)
backup
;;
5)
restore
;;
6)
wbmn
;;
7)
limit-speed
;;
8)
restart
;;
9)
speedtest
;;
10)
bbr
;;
11)
autoreboot
;;
12)
passwd
;;
13)
dns
;;
14)
netf
;;
15)
ins-helium
;;
16)
helium
;;
17)
nano /etc/issue.net
;;
18)
wget -q -O /usr/bin/swapram "https://raw.githubusercontent.com/NevermoreSSH/swapram/main/swapram.sh" && chmod +x /usr/bin/swapram && swapram
;;
#66)
#wget https://raw.githubusercontent.com/NevermoreSSH/Vergil/main2/addons/dns2.sh && chmod +x dns2.sh && ./dns2.sh
#;;
#77)
#wget https://raw.githubusercontent.com/NevermoreSSH/Vergil/main/Tunnel/udp.sh && bash udp.sh
#;;
77)
wget -q -O /usr/sbin/setup2 "https://raw.githubusercontent.com/NevermoreSSH/cfwarp/main/setup.sh" && chmod +x /usr/sbin/setup2 && setup2
;;
88)
wget -q -O /usr/bin/xraychanger "https://raw.githubusercontent.com/NevermoreSSH/Xcore-custompath/main/xraychanger.sh" && chmod +x /usr/bin/xraychanger && xraychanger
;;
99)
updatemenu
;;
x)
menu
;;
*)
echo "Please enter an correct number"
sleep 1
system
;;
esac
