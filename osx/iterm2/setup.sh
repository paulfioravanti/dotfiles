#!/bin/bash
# Copy over iterm2 settings

# get current directory
iterm_dir=$(Dirname ${BASH_SOURCE:-$0})
yellow=$(tput setaf 3)
green=$(tput setaf 2)
reset=$(tput sgr0)

echo "${yellow}Copying iterm2 config...${reset}"
cp $iterm_dir/COM.googlecode.iterm2.plist \
  ~/Library/Preferences/com.googlecode.iterm2.plist
echo "${green}Complete!${reset}"
