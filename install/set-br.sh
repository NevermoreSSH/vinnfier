#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="NevermoreSSH"
apt install rclone
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/${GitUser}/vinnfier/adata/rclone.conf"
git clone https://github.com/magnific0/wondershaper.git &> /dev/null
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user serverbackup2023@gmail.com
from serverbackup2023@gmail.com
password tyagwudsykhkqokt
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "https://raw.githubusercontent.com/${GitUser}/vinnfier/adata/system/autobackup.sh"
wget -O backup "https://raw.githubusercontent.com/${GitUser}/vinnfier/adata/system/backup.sh"
wget -O bckp "https://raw.githubusercontent.com/${GitUser}/vinnfier/adata/system/bckp.sh"
wget -O restore "https://raw.githubusercontent.com/${GitUser}/vinnfier/adata/system/restore.sh"
wget -O strt "https://raw.githubusercontent.com/${GitUser}/vinnfier/adata/system/strt.sh"
wget -O limit-speed "https://raw.githubusercontent.com/${GitUser}/vinnfier/adata/limit-speed.sh"
chmod +x autobackup
chmod +x backup
chmod +x bckp
chmod +x restore
chmod +x strt
chmod +x limit-speed
chmod +x clear-log
cd
rm -f /root/set-br.sh