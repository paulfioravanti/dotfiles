#!/bin/bash

# Install Brew, taps, packages, and casks

# Install Brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Ask for the administrator password upfront.
sudo -v

# Sudo keep-alive: update existing timestamp if set, otherwise do nothing
while true; do
  sudo -v
  sleep 60
  kill -0 "$$" || exit
done &

brew update
brew upgrade --all

# get current directory
BREW_DIR=$(dirname ${BASH_SOURCE:-$0})

for tap in $(cat $BREW_DIR/taps.txt); do
  brew tap $tap
done

for package in $(cat $BREW_DIR/packages.txt); do
  brew install $package
  brew upgrade $package
done

for cask in $(cat $BREW_DIR/casks.txt); do
  # There's currently no way to cleanly upgrade a cask yet
  # so in order to prevent multiple versions of a cask
  # polluting the Caskroom (and hence turning up in Alfred searches),
  # you need to go into the Caskroom and manually remove older versions.
  #
  # Sudo is being used to install every cask because, at the very least, casks
  # that have a pkg file require it, and there's no way to distinguish at the
  # outset whether it will be needed or not and we don't want the script to halt
  # midway prompting for a password.
  sudo brew cask install $cask
done

brew cask cleanup
brew cleanup
