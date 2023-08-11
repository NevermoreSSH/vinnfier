#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="NevermoreSSH"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
default_email=$( curl https://raw.githubusercontent.com/${GitUser}/email/main/default.conf )
emailcf=$(cat /usr/local/etc/xray/email)
#Input Domain
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn4="$(cat ~/log-install.txt | grep -w "OpenVPN SSL" | cut -d: -f2|sed 's/ //g')"
clear
cek=$(netstat -nutlp | grep -w 80)
if [[ -z $cek ]]; then
echo ""
echo -e "${BLUE}=====================================================${NC}"
echo -e "                    Add Domain"
echo -e "${BLUE}=====================================================${NC}"
echo ""
echo "Please Input Your Pointing Domain In Cloudflare "
read -rp "Domain/Host: " -e host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
#rm -f /home/homain
echo "$host" > /usr/local/etc/xray/domain
domain=$(cat /usr/local/etc/xray/domain)
echo ""
echo -e "\e[1;32mPlease enter your email Domain/Cloudflare."
echo -e "\e[1;31m(Press ENTER for default email)\e[0m"
read -p "Email : " email
default=${default_email}
new_email=$email
if [[ $email == "" ]]; then
sts=$default_email
else
sts=$new_email
fi
# email
rm -f /usr/local/etc/xray/email
echo $sts > /usr/local/etc/xray/email
echo -e "[${GREEN}Done${NC}]"

#Update Sertificate SSL
echo "Automatical Update Your Certificate SSL"
sleep 3
echo Starting Update SSL Certificate
sleep 0.5
source /var/lib/premium-script/ipvps.conf
systemctl stop xray
systemctl stop xray@vless
systemctl stop xray@trojanws
systemctl stop xray@xtls
systemctl stop xray@trojan
systemctl stop trojan-go
# generate certificates
mkdir /root/.acme.sh
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /usr/local/etc/xray/xray.crt --keypath /usr/local/etc/xray/xray.key --ecc
sleep 1
systemctl start xray
systemctl start xray@vless
systemctl start xray@trojanws
systemctl start xray@xtls
systemctl start xray@trojan
systemctl start trojan-go
#Done
echo -e "[${GREEN}Done${NC}]"
else
echo -e "\e[1;32mPort 80 is used\e[0m"
echo -e "\e[1;31mBefore changing domains, make sure port 80 is not used, if you are not sure whether port 80 is in use, please type info to see the active port.\e[0m"
sleep 1
fi