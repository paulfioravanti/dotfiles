#!/bin/bash
# Re-generate the Karabiner config file

# get current directory
karabiner_dir=$(dirname ${BASH_SOURCE:-$0})
setup_file=$karabiner_dir/setup.sh
yellow=$(tput setaf 3)
green=$(tput setaf 2)
reset=$(tput sgr0)

echo "${yellow}Generating Karabiner config...${reset}"
/Applications/Karabiner.app/Contents/Library/bin/karabiner export > $setup_file
chmod a+x $setup_file
echo "${green}Complete!${reset}"
