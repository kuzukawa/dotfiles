#!/bin/bash

## prerequisite
## You have to login to Mac App Store before use this.


# Command Line Tools
echo "Installing Command Line Tools for Xcode..."
xcode-select --install

# Prezto
[ ! -d ${ZDOTDIR:-$HOME}/.zprezto ] && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# tpm(tmux plugin)
[ ! -d ~/.tmux/plugins/tpm ] && mkdir -p ~/.tmux/plugins/tpm && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# homebrew
echo "Installing homebrew..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Executing brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "Running brew update..."
which brew >/dev/null 2>&1 && brew update --verbose

echo "Running brew upgrade..."
which brew >/dev/null 2>&1 && brew upgrade --verbose

### bundle with .Brewfile
echo "Installing apps with .Brewfile..."
ln -s `pwd`/.Brewfile ~
brew bundle --global --verbose

echo "Running brew cleanup..."
which brew >/dev/null 2>&1 && brew cleanup --verbose

### create symbolic links
./_link.sh
