#!/bin/bash
# Re-generate the Homebrew Brewfile

YELLOW=$(tput setaf 3)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

echo "${YELLOW}Generating Brewfile...${RESET}"
brew bundle dump --file=~/.dotfiles/Brewfile --force
echo "${GREEN}Complete!${RESET}"
