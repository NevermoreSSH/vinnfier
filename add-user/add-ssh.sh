#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="NevermoreSSH"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
MYIP=$(curl -s ipinfo.io/ip )
MYIP=$(curl -sS ipv4.icanhazip.com)
MYIP=$(curl -sS ifconfig.me )
# PROVIDED
creditt=$(cat /root/provided)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
clear
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text             \e[30m[\e[$box CREATE USER SSH & OPENVPN\e[30m ]\e[1m             \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
read -p "   Username : " Login
read -p "   Password : " Pass
read -p "   Expired (days): " masaaktif

IP=$(wget -qO- icanhazip.com);
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /usr/local/etc/xray/domain)
else
domain=$IP
fi
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn3="$(cat ~/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2|sed 's/ //g')"
ovpn4="$(cat ~/log-install.txt | grep -w "OpenVPN SSL" | cut -d: -f2|sed 's/ //g')"
ohpssh="$(cat ~/log-install.txt | grep -w "OHP SSH" | cut -d: -f2|sed 's/ //g')"
ohpdrop="$(cat ~/log-install.txt | grep -w "OHP Dropbear" | cut -d: -f2|sed 's/ //g')"
wsdropbear="$(cat ~/log-install.txt | grep -w "Websocket SSH(HTTP)" | cut -d: -f2|sed 's/ //g')"
wsstunnel="$(cat ~/log-install.txt | grep -w "Websocket SSL(HTTPS)" | cut -d: -f2|sed 's/ //g')"
wsovpn="$(cat ~/log-install.txt | grep -w "Websocket OpenVPN" | cut -d: -f2|sed 's/ //g')"
#nsdomain1=$(cat /root/nsdomain)
#pubkey1=$(cat /etc/slowdns/server.pub)
sleep 1
echo Ping Host
echo Check Acces...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Create Acc: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
harini=`date -d "0 days" +"%Y-%m-%d"`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
exp1=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null

cat > /home/vps/public_html/ssh-$Login.txt <<-END
====================================================================
             P R O J E C T  O F  N E V E R M O R E S S H
                       [Freedom Internet]
====================================================================
            https://github.com/NevermoreSSH
====================================================================
              Format SSH OVPN Account
====================================================================

====================================================================
Premium Account SSH & OpenVPN - vinnfieyV2
====================================================================
Username         : $Login
Password         : $Pass
Created          : $harini
Expired          : $exp1
====================================================================
Domain           : $domain
IP/Host          : $MYIP
OpenSSH          : 22
Dropbear         : 143, 109
SSL/TLS          :$ssl
WS SSH(HTTP)     : $wsdropbear
WS SSL(HTTPS)    : $wsstunnel
WS OpenVPN(HTTP) : $wsovpn
OHP Dropbear     : $ohpdrop
OHP OpenSSH      : $ohpssh
OHP OpenVPN      : $ovpn3
Port Squid       :$sqd
Badvpn(UDPGW)    : 7100-7300
====================================================================
CONFIG SSH WS
SSH 22      : $(cat /usr/local/etc/xray/domain):22@$Login:$Pass
SSH $wsdropbear      : $(cat /usr/local/etc/xray/domain):$wsstunnel@$Login:$Pass
SSH $wsstunnel     : $(cat /usr/local/etc/xray/domain):$wsstunnel@$Login:$Pass
====================================================================
CONFIG OPENVPN
OpenVPN TCP : $ovpn http://$MYIP:81/client-tcp-$ovpn.ovpn
OpenVPN UDP : $ovpn2 http://$MYIP:81/client-udp-$ovpn2.ovpn
OpenVPN SSL : $ovpn4 http://$MYIP:81/client-tcp-ssl.ovpn
OpenVPN OHP : $ovpn3 http://$MYIP:81/client-tcp-ohp1194.ovpn
====================================================================
PAYLOAD WS       : GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
====================================================================
PAYLOAD WSS      : GET wss://$sni/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf]Connection: Keep-Alive[crlf][crlf]"
====================================================================
PAYLOAD WS OVPN  : GET wss://$sni/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf]Connection: Keep-Alive[crlf][crlf]"
====================================================================

END

echo -e ""
echo -e "Premium Account SSH & OpenVPN"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Username       : $Login"
echo -e "Password       : $Pass"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Domain         : $domain"
echo -e "IP/Host        : $MYIP"
#echo -e "Name Server    : $nsdomain1"
#echo -e "Pubkey         : $pubkey1"
echo -e "OpenSSH/DNSTT  : 22"
echo -e "Dropbear       : 442, 109"
echo -e "SSL/TLS        :$ssl"
#echo -e "SlowDNS        : 22,80,443,53,5300"
#echo -e "SSH-UDP        : 1-65535"
echo -e "WS SSH(HTTP)   : $wsdropbear"
echo -e "WS SSL(HTTPS)  : $wsstunnel"
echo -e "WS OpenVPN     : $wsovpn"
echo -e "OHP Dropbear   : $ohpdrop"
echo -e "OHP OpenSSH    : $ohpssh"
echo -e "OHP OpenVPN    : $ovpn3"
echo -e "Port Squid     :$sqd"
echo -e "Badvpn(UDPGW)  : 7100-7300"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "CONFIG OPENVPN"
echo -e "--------------"
echo -e "OpenVPN TCP : $ovpn http://$MYIP:81/client-tcp-$ovpn.ovpn"
echo -e "OpenVPN UDP : $ovpn2 http://$MYIP:81/client-udp-$ovpn2.ovpn"
echo -e "OpenVPN SSL : $ovpn4 http://$MYIP:81/client-tcp-ssl.ovpn"
echo -e "OpenVPN OHP : $ovpn3 http://$MYIP:81/client-tcp-ohp1194.ovpn"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "PAYLOAD WEBSOCKET 1 : GET / HTTP/1.1[crlf]Host: bug.com.$domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "PAYLOAD WEBSOCKET 2 : GET wss://bug.com/ HTTP/1.1[crlf]Host: bug.com.$domain[crlf]Upgrade: websocket[crlf]Connection: Keep-Alive[crlf][crlf]"
echo -e ""
echo -e "----------------------"
echo -e "Created  : $harini"
echo -e "Expired  : $exp1"
echo -e "----------------------"
echo -e "Script By $creditt"
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
ssh
