#!/bin/bash
# Re-generate the lists of brew taps, packages, and casks for brew-cask

# get current directory
BREW_DIR=$(dirname ${BASH_SOURCE:-$0})

echo "Generating taps..."
brew tap > $BREW_DIR/taps.txt
echo "Generating packages..."
brew leaves > $BREW_DIR/packages.txt
echo "Generating casks..."
brew cask list > $BREW_DIR/casks.txt
echo "Complete!"
