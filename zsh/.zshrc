# andreshung's .zshrc

# aliases
if [ -f ~/.zsh_aliases ]; then
        . ~/.zsh_aliases
fi

# basic shell prompt
# autoload -Uz vcs_info
# precmd() { vcs_info }
# zstyle ':vcs_info:*' formats '%s(%F{yellow}%b%f) '
# setopt PROMPT_SUBST
# PS1='%F{yellow}%T%f %F{049}%n%f[%m] %1~ ${vcs_info_msg_0_}%# '

# antigen
source /opt/homebrew/share/antigen/antigen.zsh
antigen bundle sobolevn/wakatime-zsh-plugin
antigen apply

# postgresql default user
export PGUSER=postgres
export PGDATA='/opt/homebrew/var/postgresql@16'

# PATH
path+=('/opt/homebrew/opt/postgresql@16/bin')
path+=("/$HOME/bin")
export PATH

# starship
eval "$(starship init zsh)"
