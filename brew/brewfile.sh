#!/bin/bash

# Install the following programs from the App Store:
# XCode
# Numbers
# Pages
# iMovie
# Garageband
# Kindle
# Twitter
# PDF Squeezer
# Monosnap
# Form

# Install Brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# $ brew tap > taps.txt
for tap in `cat taps.txt`; do
  brew tap $tap
done

# $ brew leaves > packages.txt
for package in `cat packages.txt`; do
  brew install $package
  brew upgrade $package
done

# $ brew cask list > casks.txt
for cask in `cat casks.txt`; do
  # There's currently no way to cleanly upgrade a cask yet
  # so in order to prevent multiple versions of a cask
  # polluting the Caskroom (and hence turning up in Alfred searches),
  # you need to go into the Caskroom and manually remove older versions
  brew cask install $cask
done

brew cask cleanup
brew cleanup
