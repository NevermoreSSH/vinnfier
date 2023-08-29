#!/bin/bash
#Script Auto Reboot Vps
#wget https://github.com/${GitUser}/
GitUser="NevermoreSSH"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
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
# TOTAL ACC CREATE VMESS WS
total1=$(grep -c -E "^### " "/usr/local/etc/xray/config.json")
# TOTAL ACC CREATE  VLESS WS
total2=$(grep -c -E "^### " "/usr/local/etc/xray/vless.json")
# TOTAL ACC CREATE  XRAY VLESS XTLS
total3=$(grep -c -E "^### " "/usr/local/etc/xray/xtls.json")
MYIP=$(wget -qO- ifconfig.me/ip);
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /usr/local/etc/xray/domain)
else
domain=$IP
fi

# FUCTION ADD USER
function menu1 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vmess Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text            \e[30m[\e[$box CREATE USER XRAY VMESS WS\e[30m ]\e[1m             \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "   Username: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
patch=/vmess
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI/Host (Example : m.facebook.com) : " sni
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
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#none$/a\### '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/none.json
cat>/usr/local/etc/xray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "VMESS-TLS-${user}",
      "add": "${sts}${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patch",
      "type": "none",
      "host": "$sni",
      "tls": "tls",
	  "sni": "$sni"
}
EOF
cat>/usr/local/etc/xray/$user-none.json<<EOF
      {
      "v": "2",
      "ps": "VMESS-NTLS-${user}",
      "add": "${sts}${domain}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patch",
      "type": "none",
      "host": "$sni",
      "tls": "none"
}
EOF
cat>/usr/local/etc/xray/$user-MERAH.json<<EOF
      {
      "v": "2",
      "ps": "VMESS-TLS-MERAH-${user}",
      "add": "104.22.25.71",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "wss://italeem.iium.edu.my$patch",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "tls",
	  "sni": "italeem.iium.edu.my"
}
EOF
cat>/usr/local/etc/xray/$user-KUNING.json<<EOF
      {
      "v": "2",
      "ps": "VMESS-NTLS-KUNING-${user}",
      "add": "162.159.134.61",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patch",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "none"
}
EOF
cat>/usr/local/etc/xray/$user-BIRU.json<<EOF
      {
      "v": "2",
      "ps": "VMESS-TLS-BIRU-${user}",
      "add": "104.20.65.29",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "wss://onlinepayment.celcom.com.my$patch",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "tls",
	  "sni": "onlinepayment.celcom.com.my"
}
EOF

cat > /usr/local/etc/xray/$user-VMESS-WS.yaml <<-END
# CONFIG CLASH VMESS
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
  - name: MERAH-$user
    server: 104.22.25.71
    port: ${tls}
    type: vmess
    uuid: ${uuid}
    alterId: 0
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: italeem.iium.edu.my
    network: ws
    ws-opts:
      path: wss://italeem.iium.edu.my$patch
      headers:
        Host: ${sts}${domain}
    udp: true
  - name: KUNING-$user
    server: 162.159.134.61
    port: ${none}
    type: vmess
    uuid: ${uuid}
    alterId: 0
    cipher: auto
    tls: false
    skip-cert-verify: true
    servername: ${sts}${domain}
    network: ws
    ws-opts:
      path: $patch
      headers:
        Host: ${sts}${domain}
    udp: true
  - name: BIRU-$user
    server: 104.20.65.29
    port: ${tls}
    type: vmess
    uuid: ${uuid}
    alterId: 0
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: onlinepayment.celcom.com.my
    network: ws
    ws-opts:
      path: wss://onlinepayment.celcom.com.my$patch
      headers:
        Host: ${sts}${domain}
    udp: true
proxy-groups:
  - name: VMESS-AUTOSCRIPT-KEY
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
  - MATCH,VMESS-AUTOSCRIPT-KEY
END

# Copy config Yaml client ke home directory root agar mudah didownload ( YAML )
mv /usr/local/etc/xray/$user-VMESS-WS.yaml /home/vps/public_html/$user-VMESS-WS.yaml
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmesslink1="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-none.json)"
vmesslink3="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-MERAH.json)"
vmesslink4="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-KUNING.json)"
vmesslink5="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-BIRU.json)"
systemctl restart xray
systemctl restart xray@none
clear
echo -e ""
echo -e "\e[$line═════════[XRAY VMESS WS]════════\e[m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "IP/Host        : $MYIP"
echo -e "Port TLS       : ${tls}"
echo -e "Port None TLS  : ${none}"
echo -e "User ID        : ${uuid}"
echo -e "Security       : Auto"
echo -e "Network        : Ws"
echo -e "Path           : $patch"
echo -e "MultiPath      : /multipath"
echo -e "AllowInsecure  : True/Allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link TLS       : ${vmesslink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link None TLS  : ${vmesslink2}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link MERAH     : ${vmesslink3}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link KUNING    : ${vmesslink4}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link BIRU      : ${vmesslink5}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link Yaml  : http://$MYIP:81/$user-VMESS-WS.yaml"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created  : $harini"
echo -e "Expired  : $exp"
echo -e "Script By $creditt"
#echo ""
#read -n 1 -s -r -p "Press any key to back on menu xray"
#xraay
}

function menu6 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text            \e[30m[\e[$box CREATE USER XRAY VLESS WS\e[30m ]\e[1m             \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "   Username: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/vless.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
patch=/vless
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI/Host (Example : m.facebook.com) : " sni
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
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vless.json
sed -i '/#none$/a\### '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vnone.json

cat > /usr/local/etc/xray/$user-VLESS-WS.yaml <<EOF
# CONFIG CLASH VLESS
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
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: italeem.iium.edu.my
    network: ws
    ws-opts:
      path: wss://italeem.iium.edu.my$patch
      headers:
        Host: ${sts}${domain}
    udp: true
  - name: KUNING-${user}
    server: 162.159.134.61
    port: $none
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: false
    skip-cert-verify: true
    servername: ${sts}${domain}
    network: ws
    ws-opts:
      path: $patch
      headers:
        Host: ${sts}${domain}
    udp: true
  - name: BIRU-${user}
    server: 104.20.65.29
    port: $tls
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: onlinepayment.celcom.com.my
    network: ws
    ws-opts:
      path: wss://onlinepayment.celcom.com.my$patch
      headers:
        Host: ${sts}${domain}
    udp: true
proxy-groups:
  - name: VLESS-AUTOSCRIPT-KEY
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
  - MATCH,VLESS-AUTOSCRIPT-KEY
EOF

# Copy config Yaml client ke home directory root agar mudah didownload ( YAML )
mv /usr/local/etc/xray/$user-VLESS-WS.yaml /home/vps/public_html/$user-VLESS-WS.yaml
vlesslink1="vless://${uuid}@${sts}${domain}:$tls?type=ws&encryption=none&security=tls&host=${sts}${domain}&path=$patch&allowInsecure=1&sni=$sni#VLESS-TLS-${user}"
vlesslink2="vless://${uuid}@${sts}${domain}:$none?type=ws&encryption=none&security=none&host=$sni&path=$patch#VLESS-NTLS-${user}"
vlesslink3="vless://${uuid}@104.22.25.71:$tls?type=ws&encryption=none&security=tls&host=${sts}${domain}&path=wss://italeem.iium.edu.my$patch&allowInsecure=1&sni=italeem.iium.edu.my#VLESS-TLS-MERAH-${user}"
vlesslink4="vless://${uuid}@162.159.134.61:$none?type=ws&encryption=none&security=none&host=${sts}${domain}&path=$patch#VLESS-NTLS-KUNING-${user}"
vlesslink5="vless://${uuid}@104.20.65.29:$tls?type=ws&encryption=none&security=tls&host=${sts}${domain}&path=wss://onlinepayment.celcom.com.my$patch&allowInsecure=1&sni=onlinepayment.celcom.com.my#VLESS-TLS-BIRU-${user}"
systemctl restart xray@vless
systemctl restart xray@vnone
clear
echo -e ""
echo -e "\e[$line═════════[XRAY VLESS WS]════════\e[m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "IP/Host          : $MYIP"
echo -e "Port TLS         : $tls"
echo -e "Port None TLS    : $none"
echo -e "User ID          : ${uuid}"
echo -e "Encryption       : None"
echo -e "Network          : ws"
echo -e "Path             : $patch"
echo -e "MultiPath        : /multipath"
echo -e "AllowInsecure    : True/Allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link TLS         : ${vlesslink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link None TLS    : ${vlesslink2}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link MERAH       : ${vlesslink3}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link KUNING      : ${vlesslink4}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link BIRU        : ${vlesslink5}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link Yaml  : http://$MYIP:81/$user-VLESS-WS.yaml"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created   : $harini"
echo -e "Expired   : $exp"
echo -e "Script By $creditt"
#echo ""
#read -n 1 -s -r -p "Press any key to back on menu xray"
#xraay
}

function menu11 () {
clear
xtls="$(cat ~/log-install.txt | grep -w "Xray Vless Xtls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text            \e[30m[\e[$box CREATE USER XRAY VLESS XTLS\e[30m ]\e[1m            \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "   Username: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/xtls.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI/Host (Example : m.facebook.com) : " sni
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
sed -i '/#xtls$/a\### '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-vision""'","level": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/xtls.json
vlesslink1="vless://${uuid}@${sts}${domain}:$xtls?security=tls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-vision&sni=$sni#XTLS-VISION-${user}"
#vlesslink2="vless://${uuid}@${sts}${domain}:$xtls?security=tls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#XTLS-SPLICE-${user}"#
vlesslink3="vless://${uuid}@${MYIP}:$xtls?security=tls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-vision&sni=pay-dcb.u.com.my#XTLS-OREN-${user}"
vlesslink4="vless://${uuid}@${sts}${domain}:$tls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$sni#XTLS-DIRECT-${user}"
vlesslink5="vless://${uuid}@${sts}${domain}:$tls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#XTLS-SPLICE-${user}"
systemctl restart xray@xtls
clear
echo -e ""
echo -e "\e[$line════════[XRAY VLESS XTLS]════════\e[m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "Ip/Host        : ${MYIP}"
echo -e "Port Xtls      : $xtls"
echo -e "User ID        : ${uuid}"
echo -e "Encryption     : None"
echo -e "Network        : TCP"
echo -e "Flow           : Vision"
echo -e "AllowInsecure  : True"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link Xtls Direct  : ${vlesslink4}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link Xtls Splice : ${vlesslink5}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created  : $harini"
echo -e "Expired  : $exp"
echo -e "Script By $creditt"
#echo ""
#read -n 1 -s -r -p "Press any key to back on menu xray"
#xraay
}

# FUCTION DELETE USER
function menu2 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi
	clear
	echo ""
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done	
harini=$(grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^### $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/none.json
rm -f /usr/local/etc/xray/$user-tls.json
rm -f /usr/local/etc/xray/$user-none.json
rm -f /usr/local/etc/xray/$user-MERAH.json
rm -f /usr/local/etc/xray/$user-KUNING.json
rm -f /usr/local/etc/xray/$user-BIRU.json
rm -f /usr/local/etc/xray/$user-VMESS-WS.yaml
rm -f /home/vps/public_html/$user-VMESS-WS.yaml
systemctl restart xray
systemctl restart xray@none
clear
echo " Xray Vmess Ws Account Deleted Successfully"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="
#echo ""
#read -n 1 -s -r -p "Press any key to back on menu xray"
#xraay
}

function menu7 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/vless.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
harini=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/vless.json
sed -i "/^### $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/vnone.json
rm -f /usr/local/etc/xray/$user-VLESS-WS.yaml
rm -f /home/vps/public_html/$user-VLESS-WS.yaml
systemctl restart xray@vless
systemctl restart xray@vnone
clear
echo " Xray Vless Ws Account Deleted Successfully"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="
#echo ""
#read -n 1 -s -r -p "Press any key to back on menu xray"
#xraay
}

function menu12 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/xtls.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo " Delete User Xray Vless Xtls"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
harini=$(grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/xtls.json
systemctl restart xray@xtls
clear
echo " Xray Vless Xtls Account Deleted Successfully"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="
#echo ""
#read -n 1 -s -r -p "Press any key to back on menu xray"
#xraay
}

# FUCTION RENEW USER
function menu3 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
harini=$(grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp $harini $uuid/### $user $exp4 $harini $uuid/g" /usr/local/etc/xray/config.json
sed -i "s/### $user $exp $harini $uuid/### $user $exp4 $harini $uuid/g" /usr/local/etc/xray/none.json
service cron restart
clear
echo ""
echo " Xray Vmess Ws Was Successfully Renewed"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " =========================="
}

function menu8 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/vless.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
harini=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp $harini $uuid/### $user $exp4 $harini $uuid/g" /usr/local/etc/xray/vless.json
sed -i "s/### $user $exp $harini $uuid/### $user $exp4 $harini $uuid/g" /usr/local/etc/xray/vnone.json
service cron restart
clear
echo ""
echo " Xray Vless Ws Was Successfully Renewed"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " =========================="
}

function menu13 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/xtls.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "Renew User Xray Vless Xtls"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
harini=$(grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp $harini $uuid/### $user $exp4 $harini $uuid/g" /usr/local/etc/xray/xtls.json
service cron restart
clear
echo ""
echo " Xray Vless Xtls Account Was Successfully Renewed"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " =========================="
}

function menu4 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vmess Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess Ws None Tls" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER XRAY VMESS WS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
patch=/vmess
user=$(grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
harini=$(grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)

cat>/usr/local/etc/xray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "VMESS-TLS-${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patch",
      "type": "none",
      "host": "bug.com",
      "tls": "tls",
	  "sni": "bug.com"
}
EOF
cat>/usr/local/etc/xray/$user-none.json<<EOF
      {
      "v": "2",
      "ps": "VMESS-NTLS-${user}",
      "add": "${domain}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patch",
      "type": "none",
      "host": "bug.com",
      "tls": "none"
}
EOF
cat>/usr/local/etc/xray/$user-MERAH.json<<EOF
      {
      "v": "2",
      "ps": "VMESS-TLS-MERAH-${user}",
      "add": "104.22.25.71",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "wss://italeem.iium.edu.my$patch",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "tls",
	  "sni": "italeem.iium.edu.my"
}
EOF
cat>/usr/local/etc/xray/$user-KUNING.json<<EOF
      {
      "v": "2",
      "ps": "VMESS-NTLS-KUNING-${user}",
      "add": "162.159.134.61",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patch",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "none"
}
EOF
cat>/usr/local/etc/xray/$user-BIRU.json<<EOF
      {
      "v": "2",
      "ps": "VMESS-TLS-BIRU-${user}",
      "add": "104.20.65.29",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "wss://onlinepayment.celcom.com.my$patch",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "tls",
	  "sni": "onlinepayment.celcom.com.my"
}
EOF

cat > /usr/local/etc/xray/$user-VMESS-WS.yaml <<-END
# CONFIG CLASH VMESS
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
  - name: MERAH-$user
    server: 104.22.25.71
    port: ${tls}
    type: vmess
    uuid: ${uuid}
    alterId: 0
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: italeem.iium.edu.my
    network: ws
    ws-opts:
      path: wss://italeem.iium.edu.my$patch
      headers:
        Host: ${sts}${domain}
    udp: true
  - name: KUNING-$user
    server: 162.159.134.61
    port: ${none}
    type: vmess
    uuid: ${uuid}
    alterId: 0
    cipher: auto
    tls: false
    skip-cert-verify: true
    servername: ${sts}${domain}
    network: ws
    ws-opts:
      path: $patch
      headers:
        Host: ${sts}${domain}
    udp: true
  - name: BIRU-$user
    server: 104.20.65.29
    port: ${tls}
    type: vmess
    uuid: ${uuid}
    alterId: 0
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: onlinepayment.celcom.com.my
    network: ws
    ws-opts:
      path: wss://onlinepayment.celcom.com.my$patch
      headers:
        Host: ${sts}${domain}
    udp: true
proxy-groups:
  - name: VMESS-AUTOSCRIPT-KEY
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
  - MATCH,VMESS-AUTOSCRIPT-KEY
END

# Copy config Yaml client ke home directory root agar mudah didownload ( YAML )
mv /usr/local/etc/xray/$user-VMESS-WS.yaml /home/vps/public_html/$user-VMESS-WS.yaml
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmesslink1="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-none.json)"
vmesslink3="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-MERAH.json)"
vmesslink4="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-KUNING.json)"
vmesslink5="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-BIRU.json)"
clear
echo -e ""
echo -e "\e[$line═════════[XRAY VMESS WS]════════\e[m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "IP/Host        : $MYIP"
echo -e "Port TLS       : ${tls}"
echo -e "Port None TLS  : ${none}"
echo -e "User ID        : ${uuid}"
echo -e "Security       : Auto"
echo -e "Network        : ws"
echo -e "Path           : $patch"
echo -e "MultiPath      : /multipath"
echo -e "AllowInsecure  : True/Allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link TLS       : ${vmesslink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link None TLS  : ${vmesslink2}"
echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link MERAH     : ${vmesslink3}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link KUNING    : ${vmesslink4}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link BIRU      : ${vmesslink5}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link Yaml  : http://$MYIP:81/$user-VMESS-WS.yaml"
#echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created  : $harini"
echo -e "Expired  : $exp"
echo -e "Script By $creditt"
#echo ""
#read -n 1 -s -r -p "Press any key to back on menu xray"
#xraay
}

function menu9 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/vless.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER XRAY VLESS WS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
patch=/vless
user=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
harini=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)

cat > /usr/local/etc/xray/$user-VLESS-WS.yaml <<EOF
# CONFIG CLASH VLESS
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
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: italeem.iium.edu.my
    network: ws
    ws-opts:
      path: wss://italeem.iium.edu.my$patch
      headers:
        Host: ${sts}${domain}
    udp: true
  - name: KUNING-${user}
    server: 162.159.134.61
    port: $none
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: false
    skip-cert-verify: true
    servername: ${sts}${domain}
    network: ws
    ws-opts:
      path: $patch
      headers:
        Host: ${sts}${domain}
    udp: true
  - name: BIRU-${user}
    server: 104.20.65.29
    port: $tls
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: onlinepayment.celcom.com.my
    network: ws
    ws-opts:
      path: wss://onlinepayment.celcom.com.my$patch
      headers:
        Host: ${sts}${domain}
    udp: true
proxy-groups:
  - name: VLESS-AUTOSCRIPT-KEY
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
  - MATCH,VLESS-AUTOSCRIPT-KEY
EOF

# Copy config Yaml client ke home directory root agar mudah didownload ( YAML )
mv /usr/local/etc/xray/$user-VLESS-WS.yaml /home/vps/public_html/$user-VLESS-WS.yaml
vlesslink1="vless://${uuid}@${sts}${domain}:$tls?type=ws&encryption=none&security=tls&host=${sts}${domain}&path=$patch&allowInsecure=1&sni=$sni#VLESS-TLS-${user}"
vlesslink2="vless://${uuid}@${sts}${domain}:$none?type=ws&encryption=none&security=none&host=$sni&path=$patch#VLESS-NTLS-${user}"
vlesslink3="vless://${uuid}@104.22.25.71:$tls?type=ws&encryption=none&security=tls&host=${sts}${domain}&path=wss://italeem.iium.edu.my$patch&allowInsecure=1&sni=italeem.iium.edu.my#VLESS-TLS-MERAH-${user}"
vlesslink4="vless://${uuid}@162.159.134.61:$none?type=ws&encryption=none&security=none&host=${sts}${domain}&path=$patch#VLESS-NTLS-KUNING-${user}"
vlesslink5="vless://${uuid}@104.20.65.29:$tls?type=ws&encryption=none&security=tls&host=${sts}${domain}&path=wss://onlinepayment.celcom.com.my$patch&allowInsecure=1&sni=onlinepayment.celcom.com.my#VLESS-TLS-BIRU-${user}"
clear
echo -e ""
echo -e "\e[$line═════════[XRAY VLESS WS]════════\e[m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "IP/Host          : $MYIP"
echo -e "Port TLS         : $tls"
echo -e "Port None TLS    : $none"
echo -e "User ID          : ${uuid}"
echo -e "Encryption       : None"
echo -e "Network          : ws"
echo -e "Path             : $patch"
echo -e "MultiPath        : /multipath"
echo -e "AllowInsecure    : True/Allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link TLS         : ${vlesslink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link None TLS    : ${vlesslink2}"
echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link MERAH       : ${vlesslink3}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link KUNING      : ${vlesslink4}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link BIRU        : ${vlesslink5}"
#echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link Yaml  : http://$MYIP:81/$user-VLESS-WS.yaml"
#echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created   : $harini"
echo -e "Expired   : $exp"
echo -e "Script By $creditt"
#echo ""
#read -n 1 -s -r -p "Press any key to back on menu xray"
#xraay
}

function menu14 () {
clear
xtls="$(cat ~/log-install.txt | grep -w "Vless Xtls" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/xtls.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER XRAY VLESS XTLS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
harini=$(grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
vlesslink1="vless://${uuid}@${sts}${domain}:$xtls?security=tls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-vision&sni=$sni#XTLS-VISION-${user}"
#vlesslink2="vless://${uuid}@${sts}${domain}:$xtls?security=tls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#XTLS-SPLICE-${user}"#
vlesslink3="vless://${uuid}@${MYIP}:$xtls?security=tls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-vision&sni=pay-dcb.u.com.my#XTLS-OREN-${user}"
clear
echo -e ""
echo -e "\e[$line════════[XRAY VLESS XTLS]════════\e[m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "Ip/Host          : ${MYIP}"
echo -e "Port Xtls        : $xtls"
echo -e "User ID          : ${uuid}"
echo -e "Encryption       : None"
echo -e "Network          : TCP"
echo -e "Flow             : VISION"
echo -e "AllowInsecure    : True"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link Xtls Vision : ${vlesslink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
#echo -e "Link Xtls OREN  : ${vlesslink3}"
#echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created    : $harini"
echo -e "Expired    : $exp"
echo -e "Script By $creditt"
#echo ""
#read -n 1 -s -r -p "Press any key to back on menu xray"
#xraay
}

# FUCTION CEK USER
function menu5 () {
clear
echo -n > /tmp/other.txt
data=( `cat /usr/local/etc/xray/config.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
echo "-----------------------------------------";
echo "-----=[ Xray Vmess Ws User Login ]=-----";
echo "-----------------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipvmess.txt
data2=( `cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvmess.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvmess.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvmess.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvmess.txt | nl)
echo "user : $akun";
echo "$jum2";
echo ""
echo "-------------------------------"
fi
rm -rf /tmp/ipvmess.txt
rm -rf /tmp/other.txt
done
}

function menu10 () {
clear
echo -n > /tmp/other.txt
data=( `cat /usr/local/etc/xray/vless.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
echo "-----------------------------------------";
echo "-----=[ Xray Vless Ws User Login ]=-----";
echo "-----------------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipvless.txt
data2=( `cat /var/log/xray/access2.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access2.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvless.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvless.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvless.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvless.txt | nl)
echo "user : $akun";
echo "$jum2";
echo ""
echo "-------------------------------"
fi
rm -rf /tmp/ipvless.txt
rm -rf /tmp/other.txt
done
}

function menu15 () {
clear
echo -n > /tmp/other.txt
data=( `cat /usr/local/etc/xray/xtls.json | grep '^###' | cut -d ' ' -f 2`);
echo "------------------------------------------";
echo "-----=[ Xray Vless Xtls User Login ]=-----";
echo "----------=[  VISION ]=----------";
echo "------------------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipxray.txt
data2=( `cat /var/log/xray/access5.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access3.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipxray.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipxray.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipxray.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipxray.txt | nl)
echo "user : $akun";
echo "$jum2";
echo ""
echo "-------------------------------"
fi
rm -rf /tmp/ipxray.txt
rm -rf /tmp/other.txt
done
}

# MENU XRAY VMESS & VLESS
clear
echo -e ""
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text       \e[30m═[\e[$box PANEL XRAY VMESS WS\e[30m ]═         \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "    \e[$number (•1)\e[m \e[$below Create Vmess Ws Account\e[m"
echo -e "    \e[$number (•2)\e[m \e[$below Delete Vmess Ws Account\e[m"
echo -e "    \e[$number (•3)\e[m \e[$below Renew Vmess Ws Account\e[m"
echo -e "    \e[$number (•4)\e[m \e[$below Show Config Vmess Account\e[m"
echo -e "    \e[$number (•5)\e[m \e[$below Check User Login Vmess\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total1} Client\e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text       \e[30m═[\e[$box PANEL XRAY VLESS WS\e[30m ]═         \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "    \e[$number (•6)\e[m \e[$below Create Vless Ws Account\e[m"
echo -e "    \e[$number (•7)\e[m \e[$below Deleting Vless Ws Account\e[m"
echo -e "    \e[$number (•8)\e[m \e[$below Renew Vless Ws Account\e[m"
echo -e "    \e[$number (•9)\e[m \e[$below Show Config Vless Account\e[m"
echo -e "    \e[$number (10)\e[m \e[$below Check User Login Vless\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total2} Client\e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text       \e[30m═[\e[$box XRAY VLESS XTLS\e[30m ]═              \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "    \e[$number (11)\e[m \e[$below Create Xray VLess Xtls Account\e[m"
echo -e "    \e[$number (12)\e[m \e[$below Deleting Xray Vless Xtls Account\e[m"
echo -e "    \e[$number (13)\e[m \e[$below Renew Xray Vless Xtls Account\e[m"
echo -e "    \e[$number (14)\e[m \e[$below Show Config Vless Xtls Account\e[m"
echo -e "    \e[$number (15)\e[m \e[$below Check User Login Vless Xtls\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total3} Client\e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text  \e[$box x)   MENU                              \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "\e[$line"
read -rp "        Please Input Number  [1-15 or x] :  "  num
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
elif [[ "$num" = "11" ]]; then
menu11
elif [[ "$num" = "12" ]]; then
menu12
elif [[ "$num" = "13" ]]; then
menu13
elif [[ "$num" = "14" ]]; then
menu14
elif [[ "$num" = "15" ]]; then
menu15
elif [[ "$num" = "x" ]]; then
menu
else
clear
echo -e "\e[1;31mYou Entered The Wrong Number, Please Try Again!\e[0m"
sleep 1
xraay
fi
