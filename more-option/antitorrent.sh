#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="NevermoreSSH"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)

if [[ $USER != 'root' ]]; then
	echo "Oops! root privileges needed"
	exit
fi
while :
do
	clear
	echo " "
	echo " "
	echo "-----------------------------------------"
	echo "            Install Anti Torrent         "
	echo "-----------------------------------------"
	echo "Anti-torrent was already installed in your server"
	echo "You don't need to touch anything here"
	echo "Just sit back and relax"
	echo " "
	echo " ### By Nevermore ###"
	echo " "
	echo "     [ MENU ]"
	echo "1. Go Back"
	read -p "Type 1 to go back : " option2
	case $option2 in
		1)
		clear
		exit
		;;
	esac
done
cd
