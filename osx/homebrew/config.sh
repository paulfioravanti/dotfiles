#!/bin/bash
# Re-generate the Homebrew Brewfile

yellow=$(tput setaf 3)
green=$(tput setaf 2)
reset=$(tput sgr0)

echo "${yellow}Generating Brewfile...${reset}"
brew bundle dump --file=~/.dotfiles/Brewfile --force
echo "${green}Complete!${reset}"
