# alias for giving all custom bin files execute permission
source ~/dotfiles/functions.sh
alias binex="exec_to_owner ~/bin"

# alias for quickly pulling dotfiles
alias stowpull="git --git-dir=~/dotfiles/.git pull && stow --dir=~/dotfiles --adopt */ && stow --dir=~/dotfiles */"
