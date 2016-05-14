#!/bin/bash
# Regenerate config for all apps and libraries under dotfiles:

# Get current directory
DOTFILES_DIR=$(dirname $BASH_SOURCE)

# Get the aliases and functions from bashrc settings first,
# specifically for chruby
source $DOTFILES_DIR/bashrc
source $DOTFILES_DIR/ruby/rubies.sh
source $DOTFILES_DIR/osx/brew/brews.sh
source $DOTFILES_DIR/osx/karabiner/config.sh
source $DOTFILES_DIR/osx/iterm2/config.sh
