#!/bin/bash
# Re-generate the iterm2 config file

# get current directory
iterm_dir=$(Dirname ${BASH_SOURCE:-$0})
yellow=$(tput setaf 3)
green=$(tput setaf 2)
reset=$(tput sgr0)

echo "${yellow}Generating iterm2 config...${reset}"
cp ~/Library/Preferences/com.googlecode.iterm2.plist $iterm_dir/.
echo "${green}Complete!${reset}"
