#!/bin/bash
# Updates macOS, and gets the Mac ready to install developer tools.

# Install needed Apple/XCode CLI tools
softwareupdate --all --install --force --install-rosetta
# NOTE: use of git requires xcode-select to be installed, so this step very
# likely not needed during bootstrap, as it will have already been done before
# this repo is cloned.
# sudo rm -rf /Library/Developer/CommandLineTools
# xcode-select --install
sudo xcodebuild -license accept

# Generate ssh key
# https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
ssh-keygen -t ed25519 -C ""
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# macOS Preferences
# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles -bool TRUE; killall -HUP Finder
# Autohide dock
defaults write com.apple.Dock autohide -bool TRUE; killall Dock
# Turn off "Natural" scrolling everywhere
defaults write -globalDomain com.apple.swipescrolldirection -bool FALSE
