export PATH=$PATH:/usr/local/go/bin

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '


. "$HOME/.cargo/env"


