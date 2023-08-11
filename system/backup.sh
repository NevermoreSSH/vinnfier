#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="NevermoreSSH"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
IP=$(wget -qO- icanhazip.com);
date=$(date +"%Y-%m-%d")
clear
rm /usr/bin/backup && wget -q -O /usr/bin/backup "https://cdn.discordapp.com/attachments/1025016031686697020/1025016145478156360/backup.sh" && chmod +x /usr/bin/backup
