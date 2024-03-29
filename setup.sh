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

#------------------------------------------
# homebrew(arm64)
#------------------------------------------
echo "Installing homebrew..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Executing brew doctor..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew doctor

echo "Running brew update..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew update --verbose

echo "Running brew upgrade..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew upgrade --verbose

### bundle with .Brewfile
echo "Installing apps with .Brewfile..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew bundle --file ./.Brewfile --verbose

echo "Running brew cleanup..."
which brew >/dev/null 2>&1 && brew cleanup --verbose

#------------------------------------------
# homebrew(x86_64)
#------------------------------------------
echo "Installing homebrew(x86_64)..."
which /usr/local/bin/brew >/dev/null 2>&1 || arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Executing brew doctor(x86_64)..."
which /usr/local/bin/brew >/dev/null 2>&1 && arch -x86_64 /usr/local/bin/brew doctor

echo "Running brew update(x86_64)..."
which /usr/local/bin/brew >/dev/null 2>&1 && arch -x86_64 /usr/local/bin/brew update --verbose

echo "Running brew upgrade(x86_64)..."
which /usr/local/bin/brew >/dev/null 2>&1 && arch -x86_64 /usr/local/bin/brew upgrade --verbose

### bundle with .Brewfile
echo "Installing apps with .Brewfile_x86_64)..."
which /usr/local/bin/brew >/dev/null 2>&1 && arch -x86_64 /usr/local/bin/brew bundle --file ./.Brewfile_x86_64 --verbose

echo "Running brew cleanup..."
which /usr/local/bin/brew >/dev/null 2>&1 && arch -x86_64 /usr/local/bin/brew cleanup --verbose

### create symbolic links
echo "Creating symlinks..."
./_link.sh

echo "Running brew cleanup..."
which brew >/dev/null 2>&1 && brew cleanup --verbose



### zplug install
echo "Installing zplug..."
exec $SHELL -l && zplug install

### git config
git config --global commit.template ~/.commit_template
