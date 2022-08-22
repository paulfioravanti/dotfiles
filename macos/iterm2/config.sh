#!/bin/bash
# Re-generate the iterm2 config file

# get current directory
ITERM_DIR=$(Dirname "${BASH_SOURCE:-$0}")
YELLOW=$(tput setaf 3)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

echo "${YELLOW}Generating iterm2 config...${RESET}"
cp "$HOME/Library/Preferences/com.googlecode.iterm2.plist" "${ITERM_DIR}/."
echo "${GREEN}Complete!${RESET}"
