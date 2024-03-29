#!/bin/sh

# prezto files
ln -sf `pwd`/.prezto/runcoms/zlogin ~/.zlogin
ln -sf `pwd`/.prezto/runcoms/zlogout ~/.zlogout
ln -sf `pwd`/.prezto/runcoms/zpreztorc ~/.zpreztorc
ln -sf `pwd`/.prezto/runcoms/zprofile ~/.zprofile
ln -sf `pwd`/.prezto/runcoms/zshenv ~/.zshenv
ln -sf `pwd`/.prezto/runcoms/zshrc ~/.zshrc

# simple dotfiles
DOT_FILES=".gitconfig .gitignore_global .tmux.conf .emacs.d .asdfrc .commit_template .env"
for file in $DOT_FILES
do
    ln -sf `pwd`/$file ~
done
