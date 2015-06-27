#!/bin/bash
# Regenerate config for all apps and libraries under dotfiles:

# Get current directory
DOTFILES_DIR=$(dirname $BASH_SOURCE)

source $DOTFILES_DIR/ruby/rubies.sh
source $DOTFILES_DIR/osx/brew/brews.sh
source $DOTFILES_DIR/osx/karabiner/config.sh
source $DOTFILES_DIR/osx/iterm2/config.sh
