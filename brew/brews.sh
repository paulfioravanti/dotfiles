#!/bin/bash
# Re-generate the lists of brew taps, packages, and casks for brew-cask

# get current directory
DIR=$(dirname $BASH_SOURCE)

echo "Generating taps..."
brew tap > $DIR/taps.txt
echo "Generating packages..."
brew leaves > $DIR/packages.txt
echo "Generating casks..."
brew cask list > $DIR/casks.txt
echo "Complete! Run the following to install:"
echo "source ~/.dotfiles/brew/brewfile.sh"
