#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="NevermoreSSH"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
trgows="$(cat ~/log-install.txt | grep -w "Trojan Go" | cut -d: -f2|sed 's/ //g')"
echo -e "\e[0;34m.-----------------------------------------.\e[0m"
echo -e "\e[0;34m|          \e[1;33mCHANGE PORT ALL TROJAN\e[m         \e[0;34m|\e[0m"
echo -e "\e[0;34m'-----------------------------------------'\e[0m"
echo -e " \e[1;31m>>\e[0m\e[0;32mChange Port For Trojan:\e[0m"
echo -e "  [1]  Change Port Trojan GO $trgows"
echo -e "========================================"
echo -e "  [x]  Back To Menu Change Port"
echo -e "  [y]  Go To Main Menu"
echo -e ""
read -p "   Select From Options [1 or x & y] :  " prot
echo -e ""
case $prot in
1)
read -p "New Port Trojan GO : " tr2
if [ -z $tr2 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tr2)
if [[ -z $cek ]]; then
sed -i "s/$trgows/$tr2/g" /etc/trojan-go/config.json
sed -i "s/   - Trojan Go               : $trgows/   - Trojan Go               : $tr2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $trgows -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $trgows-j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tr2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tr2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart trojan-go > /dev/null
echo -e "\e[032;1mPort $tr2 modified successfully\e[0m"
else
echo -e "\e[1;31mPort $tr2 is used\e[0m"
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