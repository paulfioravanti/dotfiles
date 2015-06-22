#!/bin/bash

# Populate list of rubies by using chruby and Ruby.
# (Very helpful reference: https://robm.me.uk/ruby/2013/11/20/ruby-enp.html)

# get current directory
DIR=$(dirname $BASH_SOURCE)

echo "Generating list of Rubies..."
chruby |
ruby -pe '$_.gsub!(/^[^\w]+|-p[0-9]+/, "").gsub!("-", " ")' > $DIR/rubies.txt
echo "Complete! Run the following to install:"
echo "source ~/.dotfiles/ruby/chruby.sh"

