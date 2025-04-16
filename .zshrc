set -o correct
set -o vi
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
PROMPT='%F{cyan}%n@%m %F{green}%~%f %# '
alias ..='cd ..'
alias vi='nvim'
alias vim='nvim'
setxkbmap -option caps:escape
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$HOME/bin:$PATH"
export LS_OPTIONS="--color=auto"
alias ls='ls $LS_OPTIONS'
alias l='ls $LS_OPTIONS -l'
alias ll='ls $LS_OPTIONS -la'
alias nap='systemctl suspend'

# makes it so aliases are available in sudo
alias sudo='sudo ' 

# case-insensitive autocomplete
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tw/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tw/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tw/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tw/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# opam configuration
[[ ! -r /home/tw/.opam/opam-init/init.zsh ]] || source /home/tw/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
