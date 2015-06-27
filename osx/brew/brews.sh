#!/bin/bash
# - Re-generate the lists of brew taps, packages, and casks for brew-cask
# - Copy the Saved Search that lists all applications in the Caskroom

# get current directory
BREW_DIR=$(dirname $BASH_SOURCE)

echo "Generating taps..."
brew tap > $BREW_DIR/taps.txt
echo "Generating packages..."
brew leaves > $BREW_DIR/packages.txt
echo "Generating casks..."
brew cask list > $BREW_DIR/casks.txt
echo "Copying Homebrew Apps saved search..."
cp ~/Library/Saved\ Searches/Homebrew\ Apps.savedSearch $BREW_DIR/.
echo "Complete!"
