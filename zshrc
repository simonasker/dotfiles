# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/simon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

LS_COLORS='no=00:fi=00:di=33:ln=36:bd=00:cd=00:mi=31'
export LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

PROMPT='%F{green}%n%f@%F{blue}%m%f %F{yellow}%~%f %# '
RPROMPT='[%F{yellow}%?%f]'


if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# Setup virtualenv
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
export WORKON_HOME=~/virtenvs
