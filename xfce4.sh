#!/bin/bash 

# Hello my name is techdoc and I am the author of this script 

# this script uses GPL 3 license 

# what this script does it installs all the programs and applications i use in debian 

# and removes some programs as well 

# for xfce 

File="/tmp/out.$$"
GREP="/bin/grep"
#....

# Make sure to run this script as root 

if [ "$(id -u)" != "0" ]; then
        printf "This script must be ran as root"
        printf "using"
        exit 1


fi

#....


printf "run this script at your own risk\n"


printf "I am not responsible for what happens to your system\n"


printf "when you install this script\n"


while true;do
        read -p "Do you want to run this script? " yn
        case $yn in 
                [Yy]*)make install; break;;
                [Nn]*)exit;;
                *)printf "please answer yes or no.";;
        esac
done

apt update

apt install $(cat /home/"$USERNAME"/Downloads/Debian-xfce4/pkg.txt)

mv sources.list /etc/apt

dpkg --add-architecture i386

wget -nc https://dl.winehq.org/wine-builds/winehq.key

apt-key add winehq.key

apt update

apt install $(cat /home/"$USERNAME"/Downloads/Debian-xfce4/wine.txt) 


cat /home/"$USERNAME"/Downloads/debian/xremove.txt

read -p "Do you want to remove the following packages above? "
case $yn in
        [Yy]*)make install; break;;
        [Nn]*)exit;;
        *)printf "please answer yes or no"
        esac

apt remove ($cat /home/"$USERNAME"/Downloads/Debian-xfce4/xremove.txt)

exit

