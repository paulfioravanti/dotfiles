#!/bin/bash

# Populate list of rubies by using chruby and Ruby.
# (Very helpful reference: https://robm.me.uk/ruby/2013/11/20/ruby-enp.html)

# get current directory
ruby_dir=$(dirname ${BASH_SOURCE:-$0})
yellow=$(tput setaf 3)
green=$(tput setaf 2)
reset=$(tput sgr0)

echo "${yellow}Generating list of Rubies...${reset}"
chruby |
ruby -pe '$_.gsub!(/^[^\w]+|-p[0-9]+/, "").gsub!("-", " ")' |
uniq > $ruby_dir/rubies.txt
echo "${green}Complete!${reset}"

