#!/bin/bash

#install all the things
# apt install git nmap htop vim tmux xrpd aircrack-ng python-pip openvpn ffmpeg gobuster terminator fish mpv wireshark bat
# pip3 install updog;

create_links (){
    dotdir=~/.dotfiles
    x=$(echo $1 | cut -c 2-)
    echo "$x"
    mkdir -p $(echo ~/test$x | rev | cut -d'/' -f2- | rev)
    ln -sfn ~/.dotfiles$x ~/test$x
}

export -f create_links

find . -type f -not -path "./.git/*" -not -path "*.sh" -exec bash -c 'create_links "{}"' \;


