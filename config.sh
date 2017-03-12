#!/bin/bash
# Regenerate config for all apps and libraries under dotfiles:

# Get current directory
dotfiles_dir=$(dirname ${BASH_SOURCE:-$0})

if [ -n "$BASH_VERSION" ]; then
  # Get the aliases and functions from bashrc settings first,
  # specifically for chruby
  source $dotfiles_dir/bashrc
fi
source $dotfiles_dir/ruby/config.sh
source $dotfiles_dir/osx/homebrew/config.sh
source $dotfiles_dir/osx/iterm2/config.sh
