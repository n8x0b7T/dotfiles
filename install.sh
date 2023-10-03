#!/bin/bash

# use correct command
if command -v doas >/dev/null 2>&1; then
    sudo="doas"
elif command -v sudo >/dev/null 2>&1; then
    sudo="sudo"
else
    echo "Neither doas nor sudo is installed. Please install either of them."
    exit 1
fi

# install all the things
"$sudo" pacman -Syu
"$sudo" pacman --needed -S lsd git lazygit diff-so-fancy nmap htop ripgrep neovim vim tmux aircrack-ng openvpn ffmpeg terminator fish bpython mpv ncdu bpytop yt-dlp ranger\
    trash-cli httpie wireshark-qt bat gdu tealdeer zsh zsh-syntax-highlighting zsh-autosuggestions jq opendoas spotify-launcher ttf-jetbrains-mono-nerd opendoas tree-sitter-cli fd
pip install pwncat-cs --break-system-packages

# configure git
diff-so-fancy --set-defaults

# install paru
if [[ ! -e /usr/bin/paru ]]; then
	echo "Installing paru"
	rm -rf /tmp/paru-bin 2>/dev/null
	git clone https://aur.archlinux.org/paru-bin.git /tmp/paru-bin &&
	(cd /tmp/paru-bin && makepkg -si PKGBUILD)
	rm -rf /tmp/paru-bin 2>/dev/null
fi

paru -S -a --skipreview --sudo "$sudo" --needed zsh-fast-syntax-highlighting nautilus-open-any-terminal gobuster-bin freetube-bin blocky-bin autojump adw-gtk3 gnome-shell-extension-clipboard-history python-updog python-updog ungoogled-chromium-bin

# set deafult terminal app in nautilus
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal terminator

# set theme for syntax highlighting
zsh -c "source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh; fast-theme spa"

cd ~/.dotfiles

# install zsh plugins
git submodule update --init 

echo -e "\nMaking symlinks for:"
# find all config files, make necesary folders, create sym links
create_links(){
	#location of dotfiles
	dotdir=~/.dotfiles
	#location of home dir
	homedir=~

	x=$(echo $1 | cut -c 2-)

	echo $homedir$x
	mkdir -p $(echo $homedir$x | rev | cut -d'/' -f2- | rev)
	ln -sfn $dotdir$x $homedir$x
}

export -f create_links

find . -type f -not -path "./.git/*" -not -path "./.gitmodules" -not -path "./zsh_plugins/*" -not -path "*.sh" -not -path "*.md" -exec bash -c 'create_links "{}"' \;
