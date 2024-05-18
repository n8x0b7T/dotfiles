# https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/fishy.zsh-theme
_fishy_collapsed_wd() {
  local i pwd
  pwd=("${(s:/:)PWD/#$HOME/~}")
  if (( $#pwd > 1 )); then
    for i in {1..$(($#pwd-1))}; do
      if [[ "$pwd[$i]" = .* ]]; then
        pwd[$i]="${${pwd[$i]}[1,2]}"
      else
        pwd[$i]="${${pwd[$i]}[1]}"
      fi
    done
  fi
  echo -n "${(j:/:)pwd}"
}

# Set prompt
setopt promptsubst
PROMPT='%F{cyan}$(_fishy_collapsed_wd) %F{red}%(?..[%?] )%F{green}$ '

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


# Some plugins (installed through pacman)
source ~/.dotfiles/zsh_plugins/zsh-defer/zsh-defer.plugin.zsh

zsh-defer source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
zsh-defer source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

## auto complete
zsh-defer autoload -Uz compinit
zsh-defer compinit
zstyle ':completion:*' menu select

# Fix save file
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Fix some keybindings
bindkey -e
bindkey "^[[3~" delete-char 
bindkey "^[[F" end-of-line
bindkey "^[[H" beginning-of-line
# Disable XON/XOFF for reverse search
stty -ixon

export TERM=alacritty
