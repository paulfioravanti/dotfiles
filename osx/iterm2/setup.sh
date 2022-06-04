#!/bin/bash
# Copy over iterm2 settings

# get current directory
ITERM_DIR=$(Dirname "${BASH_SOURCE:-$0}")
YELLOW=$(tput setaf 3)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

echo "${YELLOW}Copying iterm2 config...${RESET}"
# cp "$ITERM_DIR/COM.googlecode.iterm2.plist" \
#   ~/Library/Preferences/com.googlecode.iterm2.plist
echo "${GREEN}Complete!${RESET}"
