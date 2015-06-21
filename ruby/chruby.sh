#!/bin/bash

# Install the preferred Ruby versions

# get current directory
CHRUBY_DIR=`dirname $BASH_SOURCE`

# $ chruby | ruby -n -e 'puts $_.gsub(/^[^\w]+|-p[0-9]+|\n/, "").gsub("-", " ")' > ~/.dotfiles/ruby/rubies.txt
for ruby_version in `cat $CHRUBY_DIR/rubies.txt`; do
  ruby-install $ruby_version
done

chruby `cat ~/.ruby-version`
