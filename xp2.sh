#!/bin/bash
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
data=( `cat /usr/local/etc/xray/config.json | grep '^#vms' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^#vms $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#vms $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^#vms $user $exp/,/^},{/d" /usr/local/etc/xray/none.json
systemctl disable xray@$user-tls.service
systemctl stop xray@$user-tls.service
systemctl disable xray@$user-none.service
systemctl stop xray@$user-none.service
rm -f "/usr/local/etc/xray/$user-tls.json"
rm -f "/usr/local/etc/xray/$user-none.json"
rm -f "/usr/local/etc/xray/$user-clash-for-android.yaml"
rm -f "/home/vps/public_html/$user-clash-for-android.yaml"
fi
done
systemctl restart xray
systemctl restart xray@none
# XRAY VLESS WS
data=( `cat /usr/local/etc/xray/config.json | grep '^#vls' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^#vls $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#vls $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^#vls $user $exp/,/^},{/d" /usr/local/etc/xray/none.json
fi
done
systemctl restart xray
systemctl restart xray@none
# XRAY TROJAN TCP TLS
data=( `cat /usr/local/etc/xray/akunxtr.conf | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#trx $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^### $user $exp/d" "/usr/local/etc/xray/akunxtr.conf"
fi
done
systemctl restart xray
# XRAY VLESS XTLS DIRECT
data=( `cat /usr/local/etc/xray/config.json | grep '^#vxtls' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^#vxtls $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#vxtls $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
fi
done
systemctl restart xray
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