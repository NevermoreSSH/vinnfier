#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -###############
echo -e " [INFO] Downloading Update File"
sleep 2
# hapus menu
rm -rf menu
rm -rf menu-trial
rm -rf menu-vmess
rm -rf menu-vless
rm -rf running
rm -rf clearcache
rm -rf menu-trgo
rm -rf menu-trojan
rm -rf cf
rm -rf menu-ssh
rm -rf usernew
rm -rf trial
rm -rf renew
rm -rf hapus
rm -rf cek
rm -rf member
rm -rf delete
rm -rf autokill
rm -rf ceklim
rm -rf tendang
rm -rf menu-set
rm -rf menu-domain
rm -rf add-host
rm -rf port-change
rm -rf certv2ray
rm -rf menu-webmin
rm -rf speedtest
rm -rf about
rm -rf auto-reboot
rm -rf restart
rm -rf bw
rm -rf port-ssl
rm -rf port-ovpn
rm -rf xp
rm -rf acs-set
rm -rf sshws
rm -rf status
rm -rf menu-backup
rm -rf backup
rm -rf restore
rm -rf jam
rm -rf up
rm -rf genssl
rm -rf slow
# download script
cd /usr/bin
# menu
wget -O menu "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/menu.sh"
wget -O genssl "https://raw.githubusercontent.com/awanbebas/vpn2/main/ssh/genssl.sh"
wget -O menu-trial "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/menu-trial.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/menu-vmess.sh"
wget -O menu-vless "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/menu-vless.sh"
wget -O running "https://raw.githubusercontent.com/artanodrop/v4/main/menu/running.sh"
wget -O clearcache "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/clearcache.sh"
wget -O menu-trgo "https://raw.githubusercontent.com/artanodrop/v4/main/menu/menu-trgo.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/menu-trojan.sh"
wget -O cf "https://raw.githubusercontent.com/awanbebas/vpn2/main/cf.sh"
wget -O slow "https://raw.githubusercontent.com/awanbebas/vpn2/main/slow.sh"

# menu ssh ovpn
wget -O menu-ssh "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/menu-ssh.sh"
wget -O usernew "https://raw.githubusercontent.com/awanbebas/vpn2/main/ssh/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/awanbebas/vpn2/main/ssh/trial.sh"
wget -O renew "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/renew.sh"
wget -O hapus "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/hapus.sh"
wget -O cek "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/cek.sh"
wget -O member "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/member.sh"
wget -O delete "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/delete.sh"
wget -O autokill "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/tendang.sh"

# menu system
wget -O menu-set "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/menu-set.sh"
wget -O menu-domain "https://raw.githubusercontent.com/artanodrop/v4/main/menu/menu-domain.sh"
wget -O add-host "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/add-host.sh"
wget -O port-change "https://raw.githubusercontent.com/artanodrop/v4/main/port/port-change.sh"
wget -O certv2ray "https://raw.githubusercontent.com/artanodrop/v4/main/xray/certv2ray.sh"
wget -O menu-webmin "https://raw.githubusercontent.com/artanodrop/v4/main/menu/menu-webmin.sh"
wget -O speedtest "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/speedtest_cli.py"
wget -O about "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/about.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/artanodrop/v4/main/menu/auto-reboot.sh"
wget -O restart "https://raw.githubusercontent.com/artanodrop/v4/main/menu/restart.sh"
wget -O bw "https://raw.githubusercontent.com/artanodrop/v4/main/menu/bw.sh"

# change port
wget -O port-ssl "https://raw.githubusercontent.com/artanodrop/v4/main/port/port-ssl.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/artanodrop/v4/main/port/port-ovpn.sh"


wget -O xp "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/xp.sh"
wget -O acs-set "https://raw.githubusercontent.com/artanodrop/v4/main/acs-set.sh"

wget -O sshws "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/sshws.sh"
wget -O status "https://raw.githubusercontent.com/artanodrop/v4/main/status.sh"
wget -O menu-backup "https://raw.githubusercontent.com/awanbebas/vpn2/main/backup/menu-backup.sh"
wget -O backup "https://raw.githubusercontent.com/awanbebas/vpn2/main/backup/backup.sh"
wget -O restore "https://raw.githubusercontent.com/awanbebas/vpn2/main/backup/restore.sh"

wget -O jam "https://raw.githubusercontent.com/artanodrop/v4/main/jam.sh"
wget -q -O /usr/bin/up "https://raw.githubusercontent.com/awanbebas/vpn2/main/up.sh" && chmod +x /usr/bin/up
wget -q -O /usr/bin/fix "https://raw.githubusercontent.com/awanbebas/vpn2/main/menu/fix.sh" && chmod +x /usr/bin/fix
wget https://raw.githubusercontent.com/awanbebas/vpn2/main/autoscript-ssh-slowdns/slowdns.sh && chmod +x slowdns.sh && ./slowdns.sh

chmod +x menu
chmod +x menu-trial
chmod +x menu-vmess
chmod +x menu-vless
chmod +x running
chmod +x clearcache
chmod +x menu-trgo
chmod +x menu-trojan
chmod +x fix
chmod +x up

chmod +x slow
chmod +x menu-ssh
chmod +x usernew
chmod +x trial
chmod +x renew
chmod +x hapus
chmod +x cek
chmod +x member
chmod +x delete
chmod +x autokill
chmod +x ceklim
chmod +x tendang
chmod +x genssl
chmod +x menu-set
chmod +x menu-domain
chmod +x add-host
chmod +x port-change
chmod +x certv2ray
chmod +x menu-webmin
chmod +x speedtest
chmod +x about
chmod +x auto-reboot
chmod +x restart
chmod +x bw

chmod +x port-ssl
chmod +x port-ovpn

chmod +x xp
chmod +x acs-set
chmod +x sshws
chmod +x status
chmod +x menu-backup
chmod +x backup
chmod +x restore
chmod +x jam
echo -e " [INFO] Update Successfully"
sleep 2
exit
