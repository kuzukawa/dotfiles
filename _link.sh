#!/bin/sh

# dotfiles
DOT_FILES=".gitconfig .gitignore_global .tmux.conf .emacs.d .asdfrc .commit_template .env .zsh_plugins.txt .p10k.zsh .zshrc .zprofile .zshenv .zlogin .zlogout"
for file in $DOT_FILES
do
    ln -sf `pwd`/$file ~
done
