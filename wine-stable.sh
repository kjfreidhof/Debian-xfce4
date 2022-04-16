#!/bin/bash

# Hello my name is techdoc and i am the author of this script 

# this script useses the GPL 3 license 

# what this script does is it install wine-stable in debian 

FILE="/tmp/out"
GREP="/bin/grep"

if ["$(id -u)" != "0"]
        printf "This script must be ran as root"
        printf "using sudo"
        exit 1


fi 

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

dpkg --add-architecture i386

wget -nc https://dl.winehq.org/wine-builds/winehq.key

mv winehq.key /usr/share/keyrings/winehq-archive.key

wget -nc https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources
mv winehq-bullseye.sources /etc/apt/sources.list.d/

apt update 

xargs apt install -y <wine-stable.txt

exit




