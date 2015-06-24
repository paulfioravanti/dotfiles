#!/bin/bash

# Install Brew, taps, packages, and casks

# Install Brew
ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)

brew update
brew upgrade

# get current directory
DIR=$(dirname $BASH_SOURCE)

for tap in $(cat $DIR/taps.txt); do
  brew tap $tap
done

for package in $(cat $DIR/packages.txt); do
  brew install $package
  brew upgrade $package
done

for cask in $(cat $DIR/casks.txt); do
  # There's currently no way to cleanly upgrade a cask yet
  # so in order to prevent multiple versions of a cask
  # polluting the Caskroom (and hence turning up in Alfred searches),
  # you need to go into the Caskroom and manually remove older versions
  brew cask install $cask
done

brew cask cleanup
brew cleanup
