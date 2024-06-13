# andreshung's bashrc

# UBUNTU 24.04 LTS DEFAULT PROMPT -----------------------------------

# # set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
#     xterm-color|*-256color) color_prompt=yes;;
# esac

# # uncomment for a colored prompt, if the terminal has the capability; turned
# # off by default to not distract the user: the focus in a terminal window
# # should be on the output of commands, not on the prompt
# #force_color_prompt=yes

# if [ -n "$force_color_prompt" ]; then
#     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# 	# We have color support; assume it's compliant with Ecma-48
# 	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# 	# a case would tend to support setf rather than setaf.)
# 	color_prompt=yes
#     else
# 	color_prompt=
#     fi
# fi

# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt

# # If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

# # enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     alias ls='ls --color=auto'
#     #alias dir='dir --color=auto'
#     #alias vdir='vdir --color=auto'

#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi

# MAIN --------------------------------------------------------------

# common configurations
source ~/dotfiles/.etc/common.sh

# enable starship prompt with zsh configuration
export STARSHIP_CONFIG=~/.config/starship-bash.toml
eval "$(starship init bash)"

# history settings
HISTSIZE=5000
HISTFILESIZE=5000
HISTFILE=~/.bash_history
HISTIGNORE='&:bg:fg:ls:ll:h'
HISTTIMEFORMAT='%F %T '
HISTCONTROL=ignoreboth
HISTCONTROL=erasedups
HISTCONTROL=ignorespace
shopt -s histappend
shopt -s cmdhist
shopt -s histreedit
shopt -s histverify

# window size
shopt -s checkwinsize

# wakatime for bash
source ~/dotfiles/.etc/wakatime-bash.sh

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /extra/debian_chroot ]; then
    debian_chroot=$(cat /extra/debian_chroot)
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /extra/bash_completion ]; then
    . /extra/bash_completion
  fi
fi

# ALIASES -----------------------------------------------------------

# source alias
alias src="source ~/.bashrc"

# extra aliases

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# OTHER -------------------------------------------------------------
