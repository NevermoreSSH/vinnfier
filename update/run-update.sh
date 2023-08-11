#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="NevermoreSSH"
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
echo ""
version=$(cat /home/ver)
ver=$( curl https://raw.githubusercontent.com/${GitUser}/version-t/main/version.conf )
clear
# CEK UPDATE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}[$version]${Font_color_suffix}"
Info2="${Green_font_prefix}[LATEST VERSION]${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available${Red_font_prefix}[Please Update]${Font_color_suffix}"
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/${GitUser}/version-t/main/version.conf | grep $version )
#Status Version
if [ $version = $new_version ]; then
sts="${Info2}"
else
sts="${Error}"
fi
clear
echo ""
echo ".----------------------------------------------." | lolcat
echo "|                CHECK NEW UPDATE              |" | lolcat
echo "|                Script By Nevermore              |" | lolcat
echo "'----------------------------------------------'" | lolcat
echo -e " \e[0;36mVERSION NOW \e[0;33m>>\e[0m $Info1"
echo -e " \e[0;36mSTATUS UPDATE \e[0;33m>>\e[0m $sts"
echo -e ""
echo -e "       \e[1;31mWould you like to proceed?\e[0m"
echo ""
echo "            [ Select Option ]" | lolcat
echo -e "      \e[0;32m[1]\e[0m Check Script Update Now"
echo "-----------------------------------------" | lolcat
echo -e "      \e[0;32m[x]\e[0m Back To Update Menu"
echo -e "      \e[0;32m[y]\e[0m Back To Main Menu"
echo -e ""
read -p "Please Choose 1 or x & y : " option2
case $option2 in
1)
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/${GitUser}/version-t/main/version.conf | grep $version )
if [ $version = $new_version ]; then
clear
echo ""
echo -e "\e[1;31mChecking New Version, Please Wait...!\e[m"
sleep 3
clear
echo -e "\e[1;31mUpdate Not Available\e[m"
echo ""
clear
sleep 1
echo -e "\e[1;36mYou Have The Latest Version\e[m"
echo -e "\e[1;31mThankyou.\e[0m"
sleep 2
update
fi
clear
echo -e "\e[1;31mUpdate Available Now..\e[m"
echo -e ""
sleep 2
echo -e "\e[1;36mStart Update For New Version, Please Wait..\e[m"
sleep 2
clear
echo -e "\e[0;32mGetting New Version Script By Nevermore...\e[0m"
sleep 1
echo ""
# UPDATE RUN-UPDATE
cd /usr/bin
wget -O run-update "https://raw.githubusercontent.com/${GitUser}/vinnfier/adata/update/run-update.sh"
chmod +x run-update
# RUN UPDATE
echo ""
clear
echo -e "\e[0;32mPlease Wait...!\e[0m"
sleep 6
clear
echo ""
echo -e "\e[0;32mNew Version Downloading started!\e[0m"
sleep 2
cd /usr/bin
wget -O update "https://raw.githubusercontent.com/${GitUser}/vinnfier/adata/update/update.sh"
wget -O bannermenu "https://raw.githubusercontent.com/${GitUser}/vinnfier/adata/update/bannermenu.sh"
wget -O change-port "https://raw.githubusercontent.com/${GitUser}/vinnfier/adata/change.sh"
wget -O add-ws "https://raw.githubusercontent.com/${GitUser}/vinnfier/adata/add-user/add-ws.sh"
chmod +x update
chmod +x bannermenu
chmod +x change-port
chmod +x add-ws
clear
echo -e ""
echo -e "\e[0;32mDownloaded successfully!\e[0m"
echo ""
ver=$( curl https://raw.githubusercontent.com/${GitUser}/version-t/main/version.conf )
sleep 1
echo -e "\e[0;32mPatching New Update, Please Wait...\e[0m"
echo ""
sleep 2
echo -e "\e[0;32mPatching... OK!\e[0m"
sleep 1
echo ""
echo -e "\e[0;32mSucces Update Script For New Version\e[0m"
cd
echo "$ver" > /home/ver
echo ""
echo -e " \e[1;31mReboot 5 Sec\e[0m"
sleep 5
rm -f update.sh
reboot
;;
x)
clear
update
;;
y)
clear
menu
;;
*)
clear
echo -e "\e[1;31mPlease Enter Option 1-2 or x & y Only..,Try again, Thank You..\e[0m"
sleep 2
run-update
;;
esac
