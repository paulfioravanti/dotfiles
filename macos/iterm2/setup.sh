#!/bin/bash
# Copy over iterm2 settings

# get current directory
ITERM_DIR=$(Dirname "${BASH_SOURCE:-$0}")
YELLOW=$(tput setaf 3)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

echo "${YELLOW}Setting up iTerm...${RESET}"
# Get Solarized colors for iTerm.
# iTerm should have been installed by Homebrew
git clone https://github.com/altercation/solarized.git ~/solarized
open ~/solarized/iterm2-colors-solarized/Solarized\ Dark.itermcolors
open ~/solarized/iterm2-colors-solarized/Solarized\ Light.itermcolors
# Clean up
rm -rf ~/solarized
# cp "$ITERM_DIR/COM.googlecode.iterm2.plist" \
#   ~/Library/Preferences/com.googlecode.iterm2.plist
echo "${GREEN}Complete!${RESET}"
