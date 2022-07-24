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

# Install Homebrew: https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to the main PATH as per post-installation instructions
echo "eval $(/opt/homebrew/bin/brew shellenv)" >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Enable usage of the `brew bundle` command with a `Brewfile`
brew tap Homebrew/bundle
# NOTE: `brew bundle` needs to have a `Brewfile` specified when run
# from here, *and* it can't be passed a symlink ie ~/Brewfile
brew bundle --file=~/.dotfiles/Brewfile
# Run brew updates
brew update
brew outdated
brew upgrade
brew cleanup
# Run brew cask upgrades
brew cu --all --cleanup --yes
brew cleanup
