#!/bin/bash

# Configure Brew, taps, packages, and casks

# Ask for the administrator password upfront.
sudo -v

# Sudo keep-alive: update existing timestamp if set, otherwise do nothing
while true; do
  sudo -v
  sleep 60
  kill -0 "$$" || exit
done &

# Enable usage of the `brew bundle` command with a `Brewfile`
brew tap Homebrew/bundle
# NOTE: `brew bundle` needs to have a `Brewfile` specified when run
# from here, *and* it can't be passed a symlink ie ~/Brewfile
brew bundle --file=~/.dotfiles/Brewfile
brew update
brew upgrade
# Brew cask upgrade
brew cu
brew cleanup
