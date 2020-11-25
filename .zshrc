echo "\n"
neofetch
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# User configuration
export TERM="tmux-256color-italic"
[ -z "$TMUX" ] && export TERM="xterm-256color"
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

export PATH="/usr/local/anaconda3/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source <(antibody init)
antibody bundle romkatv/powerlevel10k
antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-completions
antibody bundle zlsun/solarized-man
antibody bundle agkozak/zsh-z
antibody bundle joel-porquet/zsh-dircolors-solarized
antibody bundle robbyrussell/oh-my-zsh path:plugins/nvm
antibody bundle robbyrussell/oh-my-zsh path:plugins/fzf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
