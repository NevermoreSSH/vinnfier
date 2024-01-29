# BEFORE ANY INSTALLATION OR USAGE, PLEASE READ
- this script is free to use (strictly no reselling)
- tested on digital ocean / linode / shinjiru / myklnet / ovh without any problem
- support vmess/vless/trojan custompath port 80 only (pls using xraycore mod first)
- enjoy

# FIX SCRIPT
- backup script issue fix
                                           
<h2 align="center"> AutoScript By NevermoreSSH</h2>

<h2 align="center"> Supported Linux Distribution</h2>
<p align="center"><img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2010&message=Buster&color=blue"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2011&message=Bullseye&color=blue"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2018&message=18.04 LTS&color=blue"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2020&message=20.04 LTS&color=blue"></p>



## Commands : <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=powershell&label=Shell&message=Bash%20Script&color=lightgray">

## Update & Upgrade First Your VPS for Debian 10 & 11

  ```html
  apt update -y && apt upgrade -y && apt dist-upgrade -y && reboot
  ```

## Update & Upgrade First Your VPS for Ubuntu 18.04 & 20.04

  ```html
  apt-get update && apt-get upgrade -y && apt dist-upgrade -y && update-grub && reboot
  ```
 
## INSTALLATION SCRIPT
( IPV4 only )

  ```html
  sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/NevermoreSSH/vinnfier/adata/setup2.sh && chmod +x setup2.sh && sed -i -e 's/\r$//' setup2.sh && screen -S setup2 ./setup2.sh
  ```
or ( IPV4 + IPV6 enable )
  ```html
  apt update && apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/NevermoreSSH/vinnfier/adata/setup3.sh && chmod +x setup3.sh && sed -i -e 's/\r$//' setup3.sh && screen -S setup ./setup3.sh
  ```
 
 ## Copy & paste 👇👇 to your VPS if ERROR (WG ONLY)
 ## Wireguard

  ```html
  echo "deb http://deb.debian.org/debian/ unstable main" >/etc/apt/sources.list.d/unstable.list
printf 'Package: *\nPin: release a=unstable\nPin-Priority: 90\n' >/etc/apt/preferences.d/limit-unstable
apt update
apt install -y wireguard-tools iptables iptables-persistent
apt install -y linux-headers-$(uname -r)
  ```
 
   ```html
systemctl restart wg-quick@wg0
  ```

## Info :

 ## Script FREE using license key 

   ```html
  NevermoreSSH
  ```
  

# Description :

  ## Service & Port

  - OpenSSH                 : 22
  - OpenVPN                 : TCP 1194, UDP 2200, SSL 110
  - Stunnel4                : 222, 777
  - Dropbear                : 442, 109
  - OHP Dropbear            : 8585
  - OHP SSH                 : 8686
  - OHP OpenVPN             : 8787
  - Websocket SSH(HTTP)     : 8880
  - Websocket SSL(HTTPS)    : 222
  - Websocket OpenVPN       : 2084
  - Squid Proxy             : 3128, 8000
  - Badvpn                  : 7100, 7200, 7300
  - Nginx                   : 81
  - Wireguard               : 5820
  - Shadowsocks-R           : 1443-1543
  - SS-OBFS TLS             : 2443-2543
  - SS-OBFS HTTP            : 3443-3543
  - XRAY Vmess Ws Tls       : 443
  - XRAY Vless Ws Tls       : 443
  - XRAY Trojan Ws Tls      : 443
  - XRAY Vless Tcp XTLS     : 443
  - XRAY Vmess Ws None Tls  : 8080
  - XRAY Vless Ws None Tls  : 80
  - XRAY Trojan Ws None Tls : 2095
  - Trojan Go               : 2096

  ## Server Information & Other Features
   - Timezone                 : Asia/Kuala_Lumpur (GMT +8)
   - Fail2Ban                 : [ON]
   - DDOS Dflate              : [ON]
   - IPtables                 : [ON]
   - Auto-Reboot              : [ON]- 5.00AM
   - IPv6                     : [ON/OFF]
   - Auto-Remove-Expired      : [ON]
   - Auto Delete Expired Account
   - Fully automatic script
   - VPS settings
   - Admin Control
   - Change port
   - Full Orders For Various Services

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


<p align="center">
  <a><img src="https://img.shields.io/badge/Copyright%20©-NevermoreSSH%20AutoScriptVPN%202023.%20All%20rights%20reserved...-blueviolet.svg" style="max-width:200%;">
    </p>
   </p>
