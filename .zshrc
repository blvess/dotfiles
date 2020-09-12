export TERM="xterm-256color"
export ZSH="/Users/brian/.oh-my-zsh"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status anaconda node_version)

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=true

plugins=(docker git z fzf npm node osx pyenv yarn solarized-man zsh-completions zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
export TERM="xterm-256color"
autoload -Uz compinit && compinit -i
LSCOLORS=exfxfeaeBxxehehbadacea
export EDITOR="nvim"

# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_BASE="$HOME/.fzf"

alias vim=nvim
alias vi=nvim
alias gcc=gcc-9
alias g++=g++-9
alias :qa='tmux kill-session'

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Clear for tmux and terminal
c() {
   clear-history
   clear
}
alias cc='c'

# sqlite keg
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/sqlite/include"

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/Workspace/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export CGO_ENABLED=1

# Auto additions
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

