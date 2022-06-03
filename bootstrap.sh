#!/bin/bash
# Updates macOS, and gets the Mac ready to install developer tools.

# Install needed Apple/XCode CLI tools
softwareupdate --all --install --force --install-rosetta
sudo rm -rf /Library/Developer/CommandLineTools
xcode-select --install
sudo xcodebuild -license accept
