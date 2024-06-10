# andreshung's .zshrc

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# aliases
if [ -f ~/.zsh_aliases ]; then
        . ~/.zsh_aliases
fi

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# basic shell prompt
# autoload -Uz vcs_info
# precmd() { vcs_info }
# zstyle ':vcs_info:*' formats '%s(%F{yellow}%b%f) '
# setopt PROMPT_SUBST
# PS1='%F{yellow}%T%f %F{049}%n%f[%m] %1~ ${vcs_info_msg_0_}%# '

# antigen
# source /opt/homebrew/share/antigen/antigen.zsh
# antigen bundle sobolevn/wakatime-zsh-plugin
# antigen apply

# postgresql default user
export PGUSER=postgres
export PGDATA='/opt/homebrew/var/postgresql@16'

# PATH
path+=('/opt/homebrew/opt/postgresql@16/bin')
path+=("/$HOME/bin")
export PATH

# starship
eval "$(starship init zsh)"
