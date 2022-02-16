set fish_greeting
alias code "flatpak run com.visualstudio.code"
alias open "xdg-open"
alias myip "curl https://ifconfig.io"
alias getips "ip a s | grep -v vmnet | grep -v docker | grep -v virbr | egrep -o 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d' ' -f2"
alias changemac "sudo ip link set wlx98482790fc7d down; sudo macchanger -A wlx98482790fc7d; sudo ip link set wlx98482790fc7d up"
alias copyt "xclip -sel c"
alias pwncat pwncat-cs
begin
    set --local AUTOJUMP_PATH /usr/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

