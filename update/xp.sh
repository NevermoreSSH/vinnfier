#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="NevermoreSSH"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
# SHADOWSOCK
data=( `cat /etc/shadowsocks-libev/akun.conf | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/,/^port_http/d" "/etc/shadowsocks-libev/akun.conf"
systemctl disable shadowsocks-libev-server@$user-tls.service
systemctl disable shadowsocks-libev-server@$user-http.service
systemctl stop shadowsocks-libev-server@$user-tls.service
systemctl stop shadowsocks-libev-server@$user-http.service
rm -f "/etc/shadowsocks-libev/$user-tls.json"
rm -f "/etc/shadowsocks-libev/$user-http.json"
rm -f "/home/vps/public_html/$user-yaml-tls.yaml"
rm -f "/home/vps/public_html/$user-yaml-http.yaml"
fi
done
# SHADOWSOCKR
data=( `cat /usr/local/shadowsocksr/akun.conf | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/d" "/usr/local/shadowsocksr/akun.conf"
rm -f "/usr/local/shadowsocksr/$user-clash-for-android.yaml"
rm -f "/home/vps/public_html/$user-clash-for-android.yaml"
cd /usr/local/shadowsocksr
match_del=$(python mujson_mgr.py -d -u "${user}"|grep -w "delete user")
cd
fi
done
/etc/init.d/ssrmu restart
# WIREGUARD
data=( `cat /etc/wireguard/wg0.conf | grep '^### Client' | cut -d ' ' -f 3`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### Client $user" "/etc/wireguard/wg0.conf" | cut -d ' ' -f 4)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### Client $user $exp/,/^AllowedIPs/d" /etc/wireguard/wg0.conf
rm -f "/home/vps/public_html/$user.conf"
fi
done
systemctl restart wg-quick@wg0
# XRAY VMESS WS
data=( `cat /usr/local/etc/xray/config.json | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/none.json
systemctl disable xray@$user-tls.service
systemctl stop xray@$user-tls.service
systemctl disable xray@$user-none.service
systemctl stop xray@$user-none.service
rm -f "/usr/local/etc/xray/$user-tls.json"
rm -f "/usr/local/etc/xray/$user-none.json"
fi
done
systemctl restart xray
systemctl restart xray@none
# XRAY VLESS WS
data=( `cat /usr/local/etc/xray/vless.json | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/vless.json
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/vnone.json
fi
done
systemctl restart xray@vless
systemctl restart xray@vnone
# XRAY TROJAN WS
data=( `cat /usr/local/etc/xray/trojanws.json | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/trojanws.json
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/trnone.json
fi
done
systemctl restart xray@trojanws
systemctl restart xray@trnone
# xray vless XTLS Direct & Splice
data=( `cat /usr/local/etc/xray/xtls.json | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/xtls.json
fi
done
systemctl restart xray@xtls
# TROJAN GO
data=( `cat /etc/trojan-go/akun.conf | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/etc/trojan-go/akun.conf" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i '/^,"'"$user"'"$/d' /etc/trojan-go/config.json
sed -i "/^### $user $exp/d" "/etc/trojan-go/akun.conf"
fi
done
systemctl restart trojan-go

# FIX AUTO DELETE V2
#----- Auto Remove Vmess
data=( `cat /usr/local/etc/xray/config.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/none.json
rm -f /usr/local/etc/xray/$user-tls.json
rm -f /usr/local/etc/xray/$user-none.json
rm -f /usr/local/etc/xray/$user-clash-for-android.yaml
rm -f /home/vps/public_html/$user-clash-for-android.yaml
systemctl restart xray
systemctl restart xray@none
fi
done

#----- Auto Remove Vless
data=( `cat /usr/local/etc/xray/vless.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/vless.json
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/vnone.json
systemctl restart xray@vless
systemctl restart xray@vnone
fi
done

#----- Auto Remove Trojan WS
data=( `cat /usr/local/etc/xray/trojanws.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/trojanws.json
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/trnone.json
systemctl restart xray@trojanws
systemctl restart xray@trnone
fi
done

#----- Auto Remove Trojan G0
data=( `cat /etc/trojan-go/akun.conf | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/etc/trojan-go/akun.conf" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /etc/trojan-go/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/trojan-go/akun.conf
systemctl restart trojan-go
fi
done

#----- Auto Remove VLESS TCP XTLS
data=( `cat /usr/local/etc/xray/xtls.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/xtls.json
systemctl restart xray@xtls
fi
done

echo -e " Delete Exp User Xray Success (Nevermore)"
echo 
echo -e " Back To Menu In 2 Sec"
sleep 2
menu
