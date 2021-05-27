#!/bin/bash

#install all the things
sudo apt update
sudo apt install git nmap htop vim tmux aircrack-ng openvpn ffmpeg terminator fish bpython mpv wireshark bat
pip3 install updog;

flatpak install flathub com.bitwarden.desktop com.spotify.Client com.github.micahflee.torbrowser-launcher com.parsecgaming.parsec org.chromium.Chromium org.gimp.GIMP org.signal.Signal org.videolan.VLC --user

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

# makes binaries executable
chmod +x ~/.dotfiles/.local/bin/*

find . -type f -not -path "./.git/*" -not -path "*.sh" -not -path "*.md" -exec bash -c 'create_links "{}"' \;


