#!/bin/bash
# Updates macOS, and gets the Mac ready to install developer tools.

# Install needed Apple/XCode CLI tools
softwareupdate --all --install --force --install-rosetta
sudo rm -rf /Library/Developer/CommandLineTools
xcode-select --install
sudo xcodebuild -license accept

# Generate ssh key
# https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
ssh-keygen -t ed25519 -C ""
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
