#!/bin/bash

#install all the things
apt update
apt install git nmap htop vim tmux xrpd aircrack-ng python-pip openvpn ffmpeg gobuster terminator fish mpv wireshark bat
pip3 install updog;

#find all config files, make necesary folders, create sym links
create_links (){
    #location of dotfiles
    dotdir=~/.dotfiles
    #location of home dir
    homedir=~

    x=$(echo $1 | cut -c 2-)
    # echo "$x"
    # echo $homedir$x
    echo $homedir$x | rev | cut -d'/' -f2- | rev
    mkdir -p $(echo $homedir$x | rev | cut -d'/' -f2- | rev)
    ln -sfn $dotdir$x $homedir$x
}

export -f create_links

find . -type f -not -path "./.git/*" -not -path "*.sh" -not -path "*.md" -exec bash -c 'create_links "{}"' \;


