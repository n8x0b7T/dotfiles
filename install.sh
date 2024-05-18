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
"$sudo" pacman --needed -S less alacritty eza git github-cli lazygit diff-so-fancy nmap htop ripgrep neovim vim tmux aircrack-ng openvpn ffmpeg terminator fish bpython mpv ncdu bpytop yt-dlp ranger\
    trash-cli httpie wireshark-qt bat gdu tealdeer zsh zsh-syntax-highlighting zsh-autosuggestions jq opendoas spotify-launcher ttf-jetbrains-mono-nerd opendoas tree-sitter-cli fd\
    gnome-shell-extension-dash-to-panel pop-icon-theme dnsutils zoxide fzf
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

paru -S -a --skipreview --sudo "$sudo" --needed menulibre shellcheck-bin zsh-fast-syntax-highlighting nautilus-open-any-terminal gobuster-bin freetube-bin blocky-bin adw-gtk3\
    gnome-shell-extension-clipboard-history gnome-shell-extension-unite python-updog python-updog ungoogled-chromium-bin

# set deafult terminal app in nautilus
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal terminator

# set theme for syntax highlighting
zsh -c "source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh; fast-theme spa"

cd ~/.dotfiles || exit

# install zsh plugins
git submodule update --init 

echo -e "\nMaking symlinks for:"
# find all config files, make necesary folders, create sym links
create_links(){
	#location of dotfiles
	dotdir=~/.dotfiles
	#location of home dir
	homedir=~

	x=$(echo "$1" | cut -c 2-)

	echo $homedir"$x"
	mkdir -p "$(echo $homedir"$x" | rev | cut -d'/' -f2- | rev)"
	ln -sfn "$dotdir$x" "$homedir$x"
}

export -f create_links

rm -rf ~/.config/nvim 2>/dev/null
find . -type f -not -path "./.git/*" -not -path "./.gitmodules" -not -path "./zsh_plugins/*" -not -path "*.sh" -not -path "*.md" -exec bash -c 'create_links "{}"' \;

gsettings set org.gnome.desktop.interface icon-theme 'Pop'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>f'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'nautilus'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>t'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'alacritty'

gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Shift><Super>m']"
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Alt>m']"
gsettings set org.gnome.mutter.wayland.keybindings restore-shortcuts "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Super>Escape']"

