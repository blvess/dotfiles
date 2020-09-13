#!/usr/bin/env bash

rsync -avh ~/.zshrc .
rsync -avh ~/.gitconfig .
rsync -avh ~/.tmux.conf .
rsync -avh ~/.config/nvim/init.vim .
rsync -avh ~/.config/nvim/coc-settings.json .
rsync -avh ~/.config/alacritty/alacritty.yml .

