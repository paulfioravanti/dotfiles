#!/bin/bash

# Install the preferred Ruby versions

# get current directory
CHRUBY_DIR=`dirname $BASH_SOURCE`

# Use chruby and Ruby to generate a list of Rubies to install
# $ chruby | ruby -n -e 'puts $_.gsub(/^[^\w]+|-p[0-9]+|\n/, "").gsub("-", " ")' > ~/.dotfiles/ruby/rubies.txt
#
# This requires a while loop (as apposed to for loop used elsewhere) in the
# dotfiles due to there being spaces in the rubies.txt files and we want to
# read the file in whole line by line
while read ruby_version; do
  ruby-install $ruby_version
done < $CHRUBY_DIR/rubies.txt

chruby `cat ~/.ruby-version`
