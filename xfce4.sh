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

mv .bashrc /home/"$USERNAME"/



apt update

xargs apt install -y <pkg.txt

mv sources.list /etc/apt 

cat xremove.txt

xargs apt remove -y <xremove.txt

exit

