#!/usr/bin/env bash

rsync -avh ~/.zshrc .
rsync -avh ~/.gitconfig .
rsync -avh ~/.tmux.conf .
rsync -avh ~/.config/nvim/init.vim .
rsync -avh ~/.config/nvim/coc.vim .
rsync -avh ~/.config/nvim/coc-settings.json .
rsync -avh ~/.config/alacritty/alacritty.yml .
rsync -avh ~/.config/kitty/kitty.conf .
rsync -avh ~/.config/kitty/'Solarized Dark - Patched.conf' .
rsync -avh ~/.p10k.zsh .

# Save homebrew files
if type brew > /dev/null; then
    brew list --formula > brewfiles
fi

# Save npm global packages
if type npm > /dev/null; then
    npm ls --depth=0 -g > npmfiles
fi

