#!/bin/bash
cp ~/.vimrc ~/dotfiles
cp ~/.zshrc ~/dotfiles
cp /etc/hosts ~/dotfiles
cd ~/dotfiles
git commit -am "update"
git pull && git push
