echo "\n"
neofetch
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# User configuration
autoload -Uz compinit && compinit -i
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
export TERM="xterm-256color"
export EDITOR="nvim"

export FZF_BASE="$HOME/.fzf"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}"'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias vim=nvim
alias vi=nvim
alias ls='ls --color=auto'
alias :qa='tmux kill-session'


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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source <(antibody init)
antibody bundle romkatv/powerlevel10k
antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-completions
antibody bundle zlsun/solarized-man
antibody bundle joel-porquet/zsh-dircolors-solarized
antibody bundle robbyrussell/oh-my-zsh path:plugins/nvm
antibody bundle robbyrussell/oh-my-zsh path:plugins/fzf


