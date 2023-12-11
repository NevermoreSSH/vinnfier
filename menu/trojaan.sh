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
# TOTAL ACC CREATE  TROJAN WS
total=$(grep -c -E "^### " "/usr/local/etc/xray/trojanws.json")
# TOTAL ACC CREATE  TROJAN GO
total2=$(grep -c -E "^### " "/etc/trojan-go/akun.conf")
MYIP=$(wget -qO- ifconfig.me/ip);
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /usr/local/etc/xray/domain)
else
domain=$IP
fi
clear

# FUCTION TROJAN WS
function menu1 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Trojan Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Trojan Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text          \e[30m[\e[$box CREATE USER XRAY TROJAN WS\e[30m ]\e[1m          \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "   Username: " -e user
		user_EXISTS=$(grep -w $user /usr/local/etc/xray/trojanws.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
patch=/trojan
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI (Example : m.facebook.com) : " sni
read -p "   Expired (days) : " masaaktif
bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
harini=`date -d "0 days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp $harini $uuid"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/trojanws.json
sed -i '/#none$/a\### '"$user $exp $harini $uuid"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/trnone.json

cat > /usr/local/etc/xray/$user-TROJAN-WS.yaml <<EOF
# CONFIG CLASH TROJAN
port: 7890
socks-port: 7891
redir-port: 7892
mixed-port: 7893
tproxy-port: 7895
ipv6: false
mode: global
log-level: silent
allow-lan: true
external-controller: 0.0.0.0:9090
secret: ""
bind-address: "*"
unified-delay: true
profile:
  store-selected: true
dns:
  enable: true
  ipv6: false
  enhanced-mode: redir-host
  listen: 0.0.0.0:7874
proxies:
  - name: MERAH-${user}
    server: 104.22.25.71
    port: $tls
    type: trojan
    password: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    sni: italeem.iium.edu.my
    network: ws
    ws-opts:
      path: wss://italeem.iium.edu.my$patch
      headers:
        Host: ${sts}${domain}
    udp: true
  - name: KUNING-${user}
    server: 162.159.134.61
    port: $tls
    type: trojan
    password: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    sni: ${sts}${domain}
    network: ws
    ws-opts:
      path: $patch
      headers:
        Host: ${sts}${domain}
    udp: true
  - name: BIRU-${user}
    server: 104.20.65.29
    port: $tls
    type: trojan
    password: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    sni: onlinepayment.celcom.com.my
    network: ws
    ws-opts:
      path: wss://onlinepayment.celcom.com.my$patch
      headers:
        Host: ${sts}${domain}
    udp: true
proxy-groups:
  - name: TROJAN-AUTOSCRIPT-KEY
    type: select
    proxies:
      - MERAH-$user
      - KUNING-$user
      - BIRU-$user
      - LOAD-BALANCE
      - DIRECT
  - name: LOAD-BALANCE
    type: load-balance
    strategy: round-robin
    disable-udp: false
    url: http://www.gstatic.com/generate_204
    interval: '300'
    proxies:
      - MERAH-$user
      - KUNING-$user
      - BIRU-$user
rules:
  - MATCH,TROJAN-AUTOSCRIPT-KEY
EOF

# Copy config Yaml client ke home directory root agar mudah didownload ( YAML )
mv /usr/local/etc/xray/$user-TROJAN-WS.yaml /home/vps/public_html/$user-TROJAN-WS.yaml
trojanlink1="trojan://${uuid}@${sts}${domain}:$tls?type=ws&encryption=none&security=tls&host=${sts}${domain}&path=$patch&allowInsecure=1&sni=$sni#TROJAN-TLS-${user}"
trojanlink2="trojan://${uuid}@${sts}${domain}:$none?type=ws&encryption=none&security=none&host=$sni&path=$patch#TROJAN-NTLS-${user}"
trojanlink3="trojan://${uuid}@104.22.25.71:$tls?type=ws&encryption=none&security=tls&host=${sts}${domain}&path=wss://italeem.iium.edu.my$patch&allowInsecure=1&sni=italeem.iium.edu.my#TROJAN-TLS-MERAH-${user}"
trojanlink4="trojan://${uuid}@162.159.134.61:$none?type=ws&encryption=none&security=none&host=${sts}${domain}&path=$patch#TROJAN-NTLS-KUNING-${user}"
trojanlink5="trojan://${uuid}@104.20.65.29:$tls?type=ws&encryption=none&security=tls&host=${sts}${domain}&path=wss://onlinepayment.celcom.com.my$patch&allowInsecure=1&sni=onlinepayment.celcom.com.my#TROJAN-TLS-BIRU-${user}"
systemctl restart xray@trojanws
systemctl restart xray@trnone
clear
echo -e ""
echo -e "\e[$line═════════[XRAY TROJAN WS]════════\e[m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "IP/Host          : $MYIP"
echo -e "Port TLS         : $tls"
echo -e "Port None TLS    : $none"
echo -e "User ID          : ${uuid}"
echo -e "Encryption       : None"
echo -e "Network          : ws"
echo -e "Path             : $patch"
echo -e "AllowInsecure    : True/Allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link TLS         : ${trojanlink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link None TLS    : ${trojanlink2}"
echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link MERAH       : ${trojanlink3}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link KUNING      : ${trojanlink4}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link BIRU        : ${trojanlink5}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link Yaml  : http://$MYIP:81/$user-TROJAN-WS.yaml"
#echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created   : $harini"
echo -e "Expired   : $exp"
echo -e "Script By $creditt"
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
trojaan
}

function menu2 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/trojanws.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	echo ""
	echo " DELETE XRAY TROJAN WS"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
harini=$(grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp $harini $uuid/d" /usr/local/etc/xray/trojanws.json
sed -i "/^### $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/trnone.json
rm -f /usr/local/etc/xray/$user-TROJAN-WS.yaml
rm -f /home/vps/public_html/$user-TROJAN-WS.yaml
systemctl restart xray@trojanws
systemctl restart xray@trnone
clear
clear
echo " Xray Trojan Ws Account Deleted Successfully"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
trojaan
}

function menu3 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/trojanws.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "Renew User XRAY TROJAN WS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
harini=$(grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp $harini $uuid/### $user $exp4 $harini $uuid/g" /usr/local/etc/xray/trojanws.json
sed -i "s/### $user $exp $harini $uuid/### $user $exp4 $harini $uuid/g" /usr/local/etc/xray/trnone.json
service cron restart
clear
echo ""
echo " XRAY TROJAN WS Account Was Successfully Renewed"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " =========================="
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
trojaan
}

function menu4 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Trojan Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Trojan Ws None Tls" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/trojanws.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER XRAY TROJAN WS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
patch=/trojan
user=$(grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
harini=$(grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)

cat > /usr/local/etc/xray/$user-TROJAN-WS.yaml <<EOF
# CONFIG CLASH TROJAN
port: 7890
socks-port: 7891
redir-port: 7892
mixed-port: 7893
tproxy-port: 7895
ipv6: false
mode: global
log-level: silent
allow-lan: true
external-controller: 0.0.0.0:9090
secret: ""
bind-address: "*"
unified-delay: true
profile:
  store-selected: true
dns:
  enable: true
  ipv6: false
  enhanced-mode: redir-host
  listen: 0.0.0.0:7874
proxies:
  - name: MERAH-${user}
    server: 104.22.25.71
    port: $tls
    type: trojan
    password: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    sni: italeem.iium.edu.my
    network: ws
    ws-opts:
      path: wss://italeem.iium.edu.my$patch
      headers:
        Host: ${sts}${domain}
    udp: true
  - name: KUNING-${user}
    server: 162.159.134.61
    port: $tls
    type: trojan
    password: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    sni: ${sts}${domain}
    network: ws
    ws-opts:
      path: $patch
      headers:
        Host: ${sts}${domain}
    udp: true
  - name: BIRU-${user}
    server: 104.20.65.29
    port: $tls
    type: trojan
    password: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    sni: onlinepayment.celcom.com.my
    network: ws
    ws-opts:
      path: wss://onlinepayment.celcom.com.my$patch
      headers:
        Host: ${sts}${domain}
    udp: true
proxy-groups:
  - name: TROJAN-AUTOSCRIPT-KEY
    type: select
    proxies:
      - MERAH-$user
      - KUNING-$user
      - BIRU-$user
      - LOAD-BALANCE
      - DIRECT
  - name: LOAD-BALANCE
    type: load-balance
    strategy: round-robin
    disable-udp: false
    url: http://www.gstatic.com/generate_204
    interval: '300'
    proxies:
      - MERAH-$user
      - KUNING-$user
      - BIRU-$user
rules:
  - MATCH,TROJAN-AUTOSCRIPT-KEY
EOF

# Copy config Yaml client ke home directory root agar mudah didownload ( YAML )
mv /usr/local/etc/xray/$user-TROJAN-WS.yaml /home/vps/public_html/$user-TROJAN-WS.yaml
trojanlink1="trojan://${uuid}@${sts}${domain}:$tls?type=ws&encryption=none&security=tls&host=${sts}${domain}&path=$patch&allowInsecure=1&sni=$sni#TROJAN-TLS-${user}"
trojanlink2="trojan://${uuid}@${sts}${domain}:$none?type=ws&encryption=none&security=none&host=$sni&path=$patch#TROJAN-NTLS-${user}"
trojanlink3="trojan://${uuid}@104.22.25.71:$tls?type=ws&encryption=none&security=tls&host=${sts}${domain}&path=wss://italeem.iium.edu.my$patch&allowInsecure=1&sni=italeem.iium.edu.my#TROJAN-TLS-MERAH-${user}"
trojanlink4="trojan://${uuid}@162.159.134.61:$none?type=ws&encryption=none&security=none&host=${sts}${domain}&path=$patch#TROJAN-NTLS-KUNING-${user}"
trojanlink5="trojan://${uuid}@104.20.65.29:$tls?type=ws&encryption=none&security=tls&host=${sts}${domain}&path=wss://onlinepayment.celcom.com.my$patch&allowInsecure=1&sni=onlinepayment.celcom.com.my#TROJAN-TLS-BIRU-${user}"
clear
echo -e ""
echo -e "\e[$line═════════[XRAY TROJAN WS]════════\e[m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "IP/Host          : $MYIP"
echo -e "Port TLS         : $tls"
echo -e "Port None TLS    : $none"
echo -e "User ID          : ${uuid}"
echo -e "Encryption       : None"
echo -e "Network          : ws"
echo -e "Path             : $patch"
echo -e "AllowInsecure    : True/Allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link TLS         : ${trojanlink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link None TLS    : ${trojanlink2}"
echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link MERAH       : ${trojanlink3}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link KUNING      : ${trojanlink4}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link BIRU        : ${trojanlink5}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link Yaml  : http://$MYIP:81/$user-TROJAN-WS.yaml"
#echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created   : $harini"
echo -e "Expired   : $exp"
echo -e "Script By $creditt"
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
trojaan
}

function menu5 () {
clear
echo -n > /tmp/other.txt
data=( `cat /usr/local/etc/xray/trojanws.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
echo "----------------------------------------------";
echo "-----=[ Xray Trojan Ws User Login ]=-----";
echo "----------------------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/iptrojan.txt
data2=( `cat /var/log/xray/access4.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access3.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/iptrojan.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/iptrojan.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/iptrojan.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/iptrojan.txt | nl)
echo "user : $akun";
echo "$jum2";
echo ""
echo "-------------------------------"
fi
rm -rf /tmp/iptrojan.txt
rm -rf /tmp/other.txt
done
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
trojaan
}

# TROJAN GO
function menu6 () {
clear
uuid=$(cat /etc/trojan-go/uuid.txt)
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /usr/local/etc/xray/domain)
else
domain=$IP
fi
trgows="$(cat ~/log-install.txt | grep -w "Trojan Go" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text               \e[30m[\e[$box CREATE USER TROJAN GO\e[30m ]\e[1m               \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "   Password: " -e user
		user_EXISTS=$(grep -w $user /etc/trojan-go/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
patch=/trgo
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI (Example : m.facebook.com) : " sni
read -p "   Expired (days) : " masaaktif
bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
harini=`date -d "0 days" +"%Y-%m-%d"`
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan-go/config.json
echo -e "### $user $exp $harini $uuid" >> /etc/trojan-go/akun.conf

cat > /etc/trojan-go/$user-TROJAN-GO.yaml <<EOF
# CONFIG CLASH TROJAN GO
port: 7890
socks-port: 7891
redir-port: 7892
mixed-port: 7893
tproxy-port: 7895
ipv6: false
mode: global
log-level: silent
allow-lan: true
external-controller: 0.0.0.0:9090
secret: ""
bind-address: "*"
unified-delay: true
profile:
  store-selected: true
dns:
  enable: true
  ipv6: false
  enhanced-mode: redir-host
  listen: 0.0.0.0:7874
proxies:
  - name: KUNING-$user
    server: 162.159.134.61
    port: ${trgows}
    type: trojan
    password: ${uuid}
    skip-cert-verify: true
    sni: ${sts}${domain}
    network: ws
    ws-opts:
      path: $patch
      headers:
        Host: ${sts}${domain}
    udp: true
proxy-groups:
  - name: TROJANGO-AUTOSCRIPT-KEY
    type: select
    proxies:
      - KUNING-$user
      - DIRECT
rules:
  - MATCH,TROJANGO-AUTOSCRIPT-KEY
EOF

# Copy config Yaml client ke home directory root agar mudah didownload ( YAML )
mv /etc/trojan-go/$user-TROJAN-GO.yaml /home/vps/public_html/$user-TROJAN-GO.yaml
trojangolink1="trojan-go://${uuid}@${sts}${domain}:${trgows}?type=standard&sni=$sni&path=$patch&encryption=none#TROJANGO-${user}"
trojangolink2="trojan-go://${uuid}@${sts}${domain}:${trgows}/?sni=$sni&type=ws&host=$sni&path=$patch&encryption=none#TROJANGO-WS-${user}"
trojangolink3="trojan-go://${uuid}@162.159.134.61:${trgows}/?sni=${sts}${domain}&type=ws&host=${sts}${domain}&path=$patch&encryption=none#TROJANGO-WS-KUNING-${user}"
systemctl restart trojan-go
clear
echo -e "\e[$line════════[TROJAN GO]════════\e[m"
echo -e "Remarks  : ${user}"
echo -e "Domain   : ${domain}"
echo -e "IP/Host  : ${MYIP}"
echo -e "Port     : ${trgows}"
echo -e "Patch    : $patch"
echo -e "Key      : ${uuid}"
echo -e "Network  : Standard & Websocket"
echo -e "\e[$line═══════════════════════════\e[m"
echo -e "Trojan GO    : ${trojangolink1}"
echo -e "\e[$line═══════════════════════════\e[m"
echo -e "Trojan GO WS : ${trojangolink2}"
echo -e "\e[$line═══════════════════════════\e[m"
#echo -e "KUNING       : ${trojangolink3}"
#echo -e "\e[$line═══════════════════════════\e[m"
#echo -e "Link Yaml : http://$MYIP:81/$user-TROJAN-GO.yaml"
#echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created  : $harini"
echo -e "Expired  : $exp"
echo -e "Script By $creditt"
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
trojaan
}

function menu7 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan-go/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi
	echo ""
	echo " DELETE TROJAN GO"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
harini=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
CLIENT_NAME=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp $harini $uuid/d" /etc/trojan-go/akun.conf
sed -i '/^,"'"$user"'"$/d' /etc/trojan-go/config.json
rm -f /usr/local/etc/xray/$user-TROJAN-GO.yaml
rm -f /home/vps/public_html/$user-TROJAN-GO.yaml
systemctl restart trojan-go
service cron restart
clear
echo " Trojan Go Account Deleted Successfully"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
trojaan
}

function menu8 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan-go/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "RENEW TROJAN GO"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
harini=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp $harini $uuid/### $user $exp4 $harini $uuid/g" /etc/trojan-go/akun.conf
clear
echo ""
echo " Trojan GO Account Was Successfully Renewed"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " =========================="
echo ""
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
trojaan
}

function menu9 () {
clear
trgows="$(cat ~/log-install.txt | grep -w "Trojan Go" | cut -d: -f2|sed 's/ //g')"
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan-go/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER TROJAN GO"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
patch=/trgo
user=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
harini=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)

cat > /etc/trojan-go/$user-TROJAN-GO.yaml <<EOF
# CONFIG CLASH TROJAN GO
port: 7890
socks-port: 7891
redir-port: 7892
mixed-port: 7893
tproxy-port: 7895
ipv6: false
mode: global
log-level: silent
allow-lan: true
external-controller: 0.0.0.0:9090
secret: ""
bind-address: "*"
unified-delay: true
profile:
  store-selected: true
dns:
  enable: true
  ipv6: false
  enhanced-mode: redir-host
  listen: 0.0.0.0:7874
proxies:
  - name: KUNING-$user
    server: 162.159.134.61
    port: ${trgows}
    type: trojan
    password: ${uuid}
    skip-cert-verify: true
    sni: ${sts}${domain}
    network: ws
    ws-opts:
      path: $patch
      headers:
        Host: ${sts}${domain}
    udp: true
proxy-groups:
  - name: TROJANGO-AUTOSCRIPT-KEY
    type: select
    proxies:
      - KUNING-$user
      - DIRECT
rules:
  - MATCH,TROJANGO-AUTOSCRIPT-KEY
EOF

trojangolink1="trojan-go://${uuid}@${sts}${domain}:${trgows}?type=standard&sni=$sni&path=$patch&encryption=none#TROJANGO-${user}"
trojangolink2="trojan-go://${uuid}@${sts}${domain}:${trgows}/?sni=$sni&type=ws&host=$sni&path=$patch&encryption=none#TROJANGO-WS-${user}"
trojangolink3="trojan-go://${uuid}@162.159.134.61:${trgows}/?sni=${sts}${domain}&type=ws&host=${sts}${domain}&path=$patch&encryption=none#TROJANGO-WS-KUNING-${user}"
clear
echo -e "\e[$line════════[TROJAN GO]════════\e[m"
echo -e "Remarks  : ${user}"
echo -e "Domain   : ${domain}"
echo -e "IP/Host  : ${MYIP}"
echo -e "Port     : ${trgows}"
echo -e "Patch    : $patch"
echo -e "Key      : ${uuid}"
echo -e "Network  : Standard & Websocket"
echo -e "\e[$line═══════════════════════════\e[m"
echo -e "Trojan GO    : ${trojangolink1}"
echo -e "\e[$line═══════════════════════════\e[m"
echo -e "Trojan GO WS : ${trojangolink2}"
echo -e "\e[$line═══════════════════════════\e[m"
#echo -e "KUNING       : ${trojangolink3}"
#echo -e "\e[$line═══════════════════════════\e[m"
#echo -e "Link Yaml : http://$MYIP:81/$user-TROJAN-GO.yaml"
#echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created  : $harini"
echo -e "Expired  : $exp"
echo -e "Script By $creditt"
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
trojaan
}

function menu10 () {
clear
echo -n > /tmp/other.txt
data=( `cat /etc/trojan-go/akun.conf | grep '^###' | cut -d ' ' -f 2`);
echo "------------------------------------";
echo "-----=[ Trojan-Go User Login ]=-----";
echo "------------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/iptrojango.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep trojan-go | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/trojan-go/trojan-go.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/iptrojango.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/iptrojango.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/iptrojango.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/iptrojango.txt | nl)
echo "user : $akun";
echo "$jum2";
echo "------------------------------------";
fi
rm -rf /tmp/iptrojango.txt
done
oth=$(cat /tmp/other.txt | sort | uniq | nl)
echo "User Login (Ip Address)";
echo "$oth";
echo "------------------------------------";
rm -rf /tmp/other.txt
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
trojaan
}

# MENU TROJAN
clear
echo -e ""
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$back_text          \e[30m═[\e[$box XRAY TROJAN WS\e[30m ]═          \e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$number (•1)\e[m \e[$below Create Xray Trojan WS Account\e[m"
echo -e "   \e[$number (•2)\e[m \e[$below Deleting Xray Trojan WS Account\e[m"
echo -e "   \e[$number (•3)\e[m \e[$below Renew Xray Xray Trojan WS Account\e[m"
echo -e "   \e[$number (•4)\e[m \e[$below Show Config Xray Trojan WS Account\e[m"
echo -e "   \e[$number (•5)\e[m \e[$below Check User Login Xray Trojan WS\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total} Client\e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$back_text            \e[30m═[\e[$box TROJAN GO\e[30m ]═             \e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$number (•6)\e[m \e[$below Create Trojan Go Account\e[m"
echo -e "   \e[$number (•7)\e[m \e[$below Deleting Trojan Go Account\e[m"
echo -e "   \e[$number (•8)\e[m \e[$below Renew Trojan Go Account\e[m"
echo -e "   \e[$number (•9)\e[m \e[$below Show Config Trojan Go Account\e[m"
echo -e "   \e[$number (10)\e[m \e[$below Check User Login Trojan Go\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total2} Client\e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$back_text \e[$box x)   MENU                             \e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "\e[$line"
read -rp "      Please Input Number  [1-10 or x] :  "  num
echo -e ""
if [[ "$num" = "1" ]]; then
menu1
elif [[ "$num" = "2" ]]; then
menu2
elif [[ "$num" = "3" ]]; then
menu3
elif [[ "$num" = "4" ]]; then
menu4
elif [[ "$num" = "5" ]]; then
menu5
elif [[ "$num" = "6" ]]; then
menu6
elif [[ "$num" = "7" ]]; then
menu7
elif [[ "$num" = "8" ]]; then
menu8
elif [[ "$num" = "9" ]]; then
menu9
elif [[ "$num" = "10" ]]; then
menu10
elif [[ "$num" = "x" ]]; then
menu
else
clear
echo -e "\e[1;31mYou Entered The Wrong Number, Please Try Again!\e[0m"
sleep 1
trojaan
fi
