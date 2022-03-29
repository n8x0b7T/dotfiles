fpath=($fpath "/home/ducks/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U colors && colors
SPACESHIP_PROMPT_ORDER=(user host dir git node exec_time line_sep jobs exit_code char)
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL="$ "

# Some plugins
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fix save file
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS

# Fix some keybindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char 
bindkey "^[[F" end-of-line
bindkey "^[[H" beginning-of-line
bindkey '^[j' forward-char

# Alias!
alias sl="ls"
alias ls="ls --color"
alias grep="grep --color"
alias code="flatpak run com.visualstudio.code"
alias open="xdg-open"
alias myip="curl https://ifconfig.io"
alias getips="ip a s | grep -v vmnet | grep -v docker | grep -v virbr | egrep -o 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d' ' -f2"
alias changemac="sudo ip link set wlx98482790fc7d down; sudo macchanger -A wlx98482790fc7d; sudo ip link set wlx98482790fc7d up"
alias copyt="xclip -sel c"
alias pwncat=pwncat-cs
alias copydir="pwd | copyt"
alias f="fuck"
eval $(thefuck --alias)

ddg() {
    firefox "https://duckduckgo.com/?q=$1";
}

