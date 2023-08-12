#!/bin/bash

### Color
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'

### System Information
TANGGAL=$(date '+%Y-%m-%d')
TIMES="10"
NAMES=$(whoami)
IMP="wget -q -O"    
CHATID="1036440597"
LOCAL_DATE="/usr/bin/"
MYIP=$(wget -qO- ipinfo.io/ip)
CITY=$(curl -s ipinfo.io/city)
TIME=$(date +'%Y-%m-%d %H:%M:%S')
RAMMS=$(free -m | awk 'NR==2 {print $2}')
KEY="2145515560:AAE9WqfxZzQC-FYF1VUprICGNomVfv6OdTU"
URL="https://api.telegram.org/bot$KEY/sendMessage"
REPO="https://raw.githubusercontent.com/NevermoreSSH/vinnfier/adata/update/"
APT="apt-get -y install"
start=$(date +%s)

# update latest resolvconf for DNS
apt install resolvconf -y 

# download menu
cd /usr/bin
wget -O backup "${REPO}backup.sh"
wget -O dns "${REPO}dns.sh"
wget -O netf "${REPO}netf.sh"
wget -O system "${REPO}system.sh"
wget -O menu "${REPO}menu.sh"
wget -O ins-helium "${REPO}ins-helium.sh"

chmod +x backup
chmod +x dns
chmod +x netf
chmod +x system
chmod +x menu
chmod +x ins-helium


cd
