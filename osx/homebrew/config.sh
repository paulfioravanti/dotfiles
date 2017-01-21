#!/bin/bash
# Re-generate the Homebrew Brewfile

echo "Generating Brewfile..."
brew bundle dump --file=~/.dotfiles/Brewfile
echo "Complete!"
