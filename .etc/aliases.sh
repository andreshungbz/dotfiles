# alias for giving all custom bin files execute permission
source ~/dotfiles/.etc/functions.sh
alias binex="exec_to_owner ~/bin"

# alias for quickly pulling dotfiles
alias stowpull="git --git-dir=$HOME/dotfiles/.git pull && cd ~/dotfiles && stow */"
