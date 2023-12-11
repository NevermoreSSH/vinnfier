#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -################
echo -e " [INFO] Downloading Update File"
sleep 2
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/genssl "https://raw.githubusercontent.com/awanbebas/vpn2/main/ssh/genssl.sh" && chmod +x /usr/bin/genssl
wget -q -O /usr/bin/up "https://raw.githubusercontent.com/awanbebas/vpn2/main/up.sh" && chmod +x /usr/bin/up
wget -q -O /usr/bin/cf "https://raw.githubusercontent.com/awanbebas/vpn2/main/cf.sh" && chmod +x /usr/bin/cf
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/artanodrop/dxavier/main/update/menu-ss.sh" && chmod +x /usr/bin/menu-ss
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/menu-vmess.sh" && chmod +x /usr/bin/menu-vmess
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/menu-vless.sh" && chmod +x /usr/bin/menu-vless
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/artanodrop/dxavier/main/update/menu-trojan.sh" && chmod +x /usr/bin/menu-trojan
wget -q -O /usr/bin/menu-bot "https://raw.githubusercontent.com/artanodrop/dxavier/main/update/menu-bot.sh" && chmod +x /usr/bin/menu-bot
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/menu-ssh.sh" && chmod +x /usr/bin/menu-ssh
wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/menu-set.sh" && chmod +x /usr/bin/menu-set
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/awanbebas/vpn2/main/backup/menu-backup.sh" && chmod +x /usr/bin/menu-backup
wget -q -O /usr/bin/backup "https://raw.githubusercontent.com/awanbebas/vpn2/main/backup/backup.sh" && chmod +x /usr/bin/backup
wget -q -O /usr/bin/restore "https://raw.githubusercontent.com/awanbebas/vpn2/main/backup/restore.sh" && chmod +x /usr/bin/restore
wget -q -O /usr/bin/autobackup "https://raw.githubusercontent.com/awanbebas/vpn2/main/backup/autobackup.sh" && chmod +x /usr/bin/autobackup
wget -q -O /usr/bin/set-br "https://raw.githubusercontent.com/awanbebas/vpn2/main/backup/set-br.sh" && chmod +x /usr/bin/set-br
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/awanbebas/vpn2/main/ssh/usernew.sh" && chmod +x /usr/bin/usernew
wget -q -O /usr/bin/cek "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/cek.sh" && chmod +x /usr/bin/cek
wget -q -O /usr/bin/member "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/member.sh" && chmod +x /usr/bin/member
wget -q -O /usr/bin/delete "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/delete.sh" && chmod +x /usr/bin/delete
wget -q -O /usr/bin/ceklim "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/ceklim.sh" && chmod +x /usr/bin/ceklim
wget -q -O /usr/bin/hapus "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/hapus.sh" && chmod +x /usr/bin/hapus
wget -q -O /usr/bin/renew "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/renew.sh" && chmod +x /usr/bin/renew
wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/trial.sh" && chmod +x /usr/bin/trial
wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/artanodrop/v4/main/xray/add-ws.sh" && chmod +x /usr/bin/add-ws
wget -q -O /usr/bin/cek-ws "https://raw.githubusercontent.com/artanodrop/v4/main/xray/cek-ws.sh" && chmod +x /usr/bin/cek-ws
wget -q -O /usr/bin/renew-ws "https://raw.githubusercontent.com/artanodrop/v4/main/xray/renew-ws.sh" && chmod +x /usr/bin/renew-ws
wget -q -O /usr/bin/del-ws "https://raw.githubusercontent.com/artanodrop/v4/main/xray/del-ws.sh" && chmod +x /usr/bin/del-ws
wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/xp.sh" && chmod +x /usr/bin/xp
wget -q -O /usr/bin/autokill "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/autokill.sh" && chmod +x /usr/bin/autokill
wget -q -O /usr/bin/add-host "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/add-host.sh" && chmod +x /usr/bin/add-host
wget https://raw.githubusercontent.com/awanbebas/vpn2/main/backup/set-br.sh &&  chmod +x set-br.sh && ./set-br.sh
echo -e " [INFO] Update Successfully"
sleep 2
exit
