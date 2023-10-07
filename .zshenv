
#PATH
export PATH=~/go/bin:/var/lib/flatpak/exports/bin:~/.local/bin:~/.ghcup/ghc/9.2.8/bin:$PATH

# Alias!
alias sudo='doas'
alias ls="lsd --group-dirs=first --date relative -F --icon=never"
alias vim="nvim"
alias grep="grep --color"
alias open="xdg-open"
alias myip="curl https://ifconfig.io"
alias copyt="xclip -sel c"
alias pwncat=pwncat-cs
alias copydir="pwd | copyt"
alias nano="nano -0l"
alias edit="gnome-text-editor"
alias rtrackpad="sudo rmmod hid_multitouch && sudo modprobe hid_multitouch"
alias htop="htop -t"
alias paru="paru --sudo doas"
alias upgrade='paru -Syu'
alias up='python3 -m http.server'
alias updot='(cd ~/.dotfiles; git pull)'
alias gradlei="echo | gradle init --type java-application --dsl kotlin --test-framework junit-jupiter"

getips(){
    ip a | grep -vE "vmnet|docker|virbr|br-|127\.0\.0\.1" | awk '/inet / {print $2}' | cut -d '/' -f1
}

metarm(){
    exiftool -All= -overwrite_original $1
}

# ghidra auto script
auto_ghidra(){
  tmp_path="/tmp/auto_ghidra"
  rm -r $tmp_path 2>/dev/null
  mkdir -p $tmp_path
  ghidra-analyzeHeadless $tmp_path "$1" -import "$1"
  ghidra "$tmp_path/$1.gpr"
}
