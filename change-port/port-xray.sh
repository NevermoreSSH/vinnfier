#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="NevermoreSSH"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
tls="$(cat ~/log-install.txt | grep -w "Vmess Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess Ws None Tls" | cut -d: -f2|sed 's/ //g')"
tlsvl="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2|sed 's/ //g')"
nonevl="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2|sed 's/ //g')"
xtls="$(cat ~/log-install.txt | grep -w "Vless Xtls" | cut -d: -f2|sed 's/ //g')"
tlstr="$(cat ~/log-install.txt | grep -w "Trojan Ws Tls" | cut -d: -f2|sed 's/ //g')"
nonetr="$(cat ~/log-install.txt | grep -w "Trojan Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e "\e[0;34m.-----------------------------------------.\e[0m"
echo -e "\e[0;34m|             \e[1;33mCHANGE PORT XRAY\e[m            \e[0;34m|\e[0m"
echo -e "\e[0;34m'-----------------------------------------'\e[0m"
echo -e " \e[1;31m>>\e[0m\e[0;32mChange Port For Xray :\e[0m"
echo -e "  [1]  Change Port Xray Vmess, Vless & Trojan Ws Tls $tls"
echo -e "  [2]  Change Port Xray Vmess Ws None TLS $none"
echo -e "  [3]  Change Port Xray Vless Ws None TLS $nonevl"
echo -e "  [4]  Change Port Xray Trojan Ws None TLS $nonetr"
echo -e "========================================"
echo -e "  [x]  Back To Menu Change Port"
echo -e "  [y]  Go To Main Menu"
echo -e ""
read -p "   Select From Options [1-4 or x & y] :  " prot
echo -e ""
case $prot in
1)
read -p "New Port Xray Vmess, Vless & Trojan: " tls1
if [ -z $tls1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$xtls/$tls1/g" /usr/local/etc/xray/xtls.json
sed -i "s/   - Xray Vmess Ws Tls       : $tls/   - Xray Vmess Ws Tls       : $tls1/g" /root/log-install.txt
sed -i "s/   - Xray Vless Ws Tls       : $tls/   - Xray Vless Ws Tls       : $tls1/g" /root/log-install.txt
sed -i "s/   - Xray Vless Xtls         : $tls/   - Xray Vless Xtls         : $tls1/g" /root/log-install.txt
sed -i "s/   - Xray Trojan Ws Tls      : $tls/   - Xray Trojan Ws Tls      : $tls1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $xtls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $xtls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray@xtls > /dev/null
systemctl restart xray > /dev/null
systemctl restart xray@vless > /dev/null
systemctl restart xray@trojanws > /dev/null
echo -e "\e[032;1mPort $tls1 modified successfully\e[0m"
else
echo -e "\e[1;31mPort $tls1 is used\e[0m"
fi
;;
2)
echo "Input Only 2 Character (eg : 69, 89)"
read -p "New Port Xray Vmess Ws None TLS: " none1
if [ -z $none1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$none/$none1/g" /usr/local/etc/xray/none.json
sed -i "s/   - Xray Vmess Ws None Tls  : $none/   - Xray Vmess Ws None Tls  : $none1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray@none > /dev/null
echo -e "\e[032;1mPort $none1 modified successfully\e[0m"
else
echo -e "\e[1;31mPort $none1 is used\e[0m"
fi
;;
3)
read -p "New Port Xray Vless Ws None TLS: " none1
if [ -z $none1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$nonevl/$none1/g" /usr/local/etc/xray/vnone.json
sed -i "s/   - Xray Vless Ws None Tls  : $nonevl/   - Xray Vless Ws None Tls  : $none1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $nonevl -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $nonevl -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray@vnone > /dev/null
echo -e "\e[032;1mPort $none1 modified successfully\e[0m"
else
echo -e "\e[1;31mPort $none1 is used\e[0m"
fi
;;
4)
read -p "New Port Xray Trojan Ws None TLS: " none1
if [ -z $none1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$nonetr/$none1/g" /usr/local/etc/xray/trnone.json
sed -i "s/   - Xray Trojan Ws None Tls : $nonetr/   - Xray Trojan Ws None Tls : $none1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $nonetr -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $nonetr -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray@trnone > /dev/null
echo -e "\e[032;1mPort $none1 modified successfully\e[0m"
else
echo -e "\e[1;31mPort $none1 is used\e[0m"
fi
;;
x)
clear
change-port
;;
y)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
