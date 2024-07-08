#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="NevermoreSSH"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
domain=$(cat /usr/local/etc/xray/domain)
IPVPS=$(curl -s ipinfo.io/ip )
IPVPS=$(curl -s ipinfo.io/ip )
IPVPS=$(curl -sS ipv4.icanhazip.com)
IPVPS=$(curl -sS ifconfig.me )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$(free -m | awk 'NR==2 {print $3}')
clear
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
clear
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*/} / ${corediilik:-1}))"
cpu_usage+=" %"
# Interface vnstat
interface1="$(ifconfig | awk 'NR==1 {sub(/:$/, "", $1); print $1}')"
# Download/Upload today
dtoday="$(vnstat -i "$interface1" | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i "$interface1" | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i "$interface1" | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
# Download/Upload yesterday
dyest="$(vnstat -i "$interface1" | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i "$interface1" | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i "$interface1" | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
# Download/Upload current month
dmon="$(vnstat -i "$interface1" -m | grep "$(date +"%b '%y")" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i "$interface1" -m | grep "$(date +"%b '%y")" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i "$interface1" -m | grep "$(date +"%b '%y")" | awk '{print $9" "substr ($10, 1, 1)}')"

# Fixed vnstat for ubuntu v2
# TOTAL ACC CREATE VMESS WS
vmess=$(grep -c -E "^### " "/usr/local/etc/xray/config.json")
# TOTAL ACC CREATE  VLESS WS
vless=$(grep -c -E "^### " "/usr/local/etc/xray/vless.json")
# TOTAL ACC CREATE  VLESS XTLS
vtls=$(grep -c -E "^### " "/usr/local/etc/xray/xtls.json")
# TOTAL ACC CREATE  TROJAN GO
trgo=$(grep -c -E "^### " "/etc/trojan-go/akun.conf")
# TOTAL ACC CREATE  TROJAN WS TLS
trws=$(grep -c -E "^### " "/usr/local/etc/xray/trojanws.json")
# TOTAL ACC CREATE OVPN SSH
total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
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
# BANNER
banner=$(cat /usr/bin/bannerku)
ascii=$(cat /usr/bin/test)
clear
echo -e "\e[$banner_colour"
figlet -f $ascii "$banner"
echo -e "\e[$text Premium Script"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   " \e[$back_text                    \e[30m[\e[$box SERVER INFORMATION\e[30m ]\e[1m                  \e[m"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e "  \e[$text Operation System     : "$(hostnamectl | grep "Operating System" | cut -d ' ' -f5-)
echo -e "  \e[$text Kernel               : $(uname -r)"
echo -e "  \e[$text Cpu Model            :$cname"
echo -e "  \e[$text Number Of Core       : $cores"
echo -e "  \e[$text CPU Usage            : $cpu_usage"
echo -e "  \e[$text Cpu Frequency        :$freq MHz"
echo -e "  \e[$text Total Amount Of Ram  : $uram MB / $tram MB"
echo -e "  \e[$text System Uptime        : $uptime"
echo -e "  \e[$text Ip Vps/Address       : $IPVPS"
echo -e "  \e[$text Domain Name          : $domain\e[0m"
echo -e "  \e[$text Version Name         : Websocket v2 (latest)"
echo -e "  \e[$text Certificate Status   : Lifetime"
echo -e "  \e[$text Provided By          : $creditt"
echo -e " \e[$line╒════════════════════════════════════════════════════════════╕\e[m"
echo -e "  \e[$text Traffic\e[0m       \e[${text}Today      Yesterday       Month   "
echo -e "  \e[$text Download\e[0m   \e[${text}   $dtoday    $dyest       $dmon   \e[0m"
echo -e "  \e[$text Upload\e[0m     \e[${text}   $utoday    $uyest       $umon   \e[0m"
echo -e "  \e[$text Total\e[0m       \e[${text}  $ttoday    $tyest       $tmon  \e[0m "
echo -e " \e[$line╘════════════════════════════════════════════════════════════╛\e[m"
echo -e " \e[$text Ssh/Ovpn   Vmess   Vless   Vless-XTLS   Trojan-Ws   Trojan-GO \e[0m "    
echo -e " \e[$below    $total_ssh         $vmess       $vless         $vtls           $trws           $trgo \e[0m "
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   " \e[$back_text                        \e[30m[\e[$box MAIN MENU\e[30m ]\e[1m                       \e[m"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$number (•1)\e[m \e[$below XRAY VMESS & VLESS\e[m          \e[$number (•7)\e[m \e[$below MENU THEMES\e[m"
echo -e   "  \e[$number (•2)\e[m \e[$below TROJAN XRAY & GO\e[m            \e[$number (•8)\e[m \e[$below CLEAR LOG VPS\e[m"
echo -e   "  \e[$number (•3)\e[m \e[$below PANEL WIREGUARDS\e[m            \e[$number (•9)\e[m \e[$below CHANGE PORT\e[m"
echo -e   "  \e[$number (•4)\e[m \e[$below PANEL SHADOWSOCKS\e[m           \e[$number (10)\e[m \e[$below CHECK RUNNING\e[m"
echo -e   "  \e[$number (•5)\e[m \e[$below OPENSSH & OPENVPN\e[m           \e[$number (11)\e[m \e[$below TRAFFIC XRAY\e[m"
echo -e   "  \e[$number (•6)\e[m \e[$below SYSTEM MENU\e[m                 \e[$number (12)\e[m \e[$below INFO ALL PORT\e[m"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$below Premium VPS by $creditt"
echo -e   "  \e[$below Thank you for using this script"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   ""
echo -e   "  \e[$below [Ctrl + C] For exit from main menu\e[m"
echo -e   "\e[$below "
read -p   "   Select From Options [1-12 or x] :  " menu
echo -e   ""
case $menu in
1)
xraay
;;
2)
trojaan
;;
3)
wgr
;;
4)
ssssr
;;
5)
ssh
;;
6)
system
;;
7)
themes
;;
8)
clear-log
;;
9)
change-port
;;
10)
check-sc
;;
11)
trafficxray
;;
12)
info
;;
x)
clear
exit
echo  -e "\e[1;31mPlease Type menu For More Option, Thank You\e[0m"
;;
*)
clear
echo  -e "\e[1;31mPlease enter an correct number\e[0m"
sleep 1
menu
;;
esac
