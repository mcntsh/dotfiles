#!/bin/sh

## SHELL

brew update
brew install zsh zsh-completions
brew install zplug

# Theme

zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
zplug chrissicool/zsh-256color
zplug zsh-users/zsh-syntax-highlighting, defer:2

# Vim

pip3 install neovim --upgrade

# Node

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
