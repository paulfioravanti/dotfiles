#!/bin/bash
# Regenerate config for all apps and libraries under dotfiles:

# Get current directory
DOTFILES_DIR=$(dirname "${BASH_SOURCE:-$0}")

if [ -n "$BASH_VERSION" ]; then
  # Get the aliases and functions from bashrc settings first.
  source "${DOTFILES_DIR}/bashrc"
fi
source "${DOTFILES_DIR}/macos/homebrew/config.sh"
source "${DOTFILES_DIR}/macos/iterm2/config.sh"
