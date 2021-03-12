# Path to your oh-my-zsh installation.
export ZSH="/Users/brian/.oh-my-zsh"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
    git
    nvm
    fzf
    z
    osx
    docker
    docker-compose
    zsh-completions
    zsh-autosuggestions
    zsh-dircolors-solarized
    fast-syntax-highlighting
    vagrant
)

source $ZSH/oh-my-zsh.sh

echo "\n"
neofetch
# alias dircolors='gdircolors'
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# User configuration
export TERM="xterm-256color"
export EDITOR="nvim"
# reset terminal to emacs mode
bindkey -e
autoload -Uz compinit && compinit -i

# Enable Ctrl-x Ctrl-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_BASE="$HOME/.fzf"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}"'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias vim=nvim
alias vi=nvim
alias ls='ls --color=auto'
alias :qa='tmux kill-session'


# Options stacking
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# sqlite keg
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/sqlite/include"

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export CGO_ENABLED=1

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
