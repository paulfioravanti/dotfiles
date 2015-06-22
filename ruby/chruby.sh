#!/bin/bash
# Install Ruby versions using chruby

# get current directory
DIR=$(dirname $BASH_SOURCE)

# This file read requires a while loop (as apposed to for loops used elsewhere
# in the dotfiles) due to there being spaces in the rubies.txt file. We want to
# read the file in whole line by line, not have a new line created on a space.
while read ruby_version; do
  if [ "$ruby_version" == "ruby 1.8.7" ]; then
    # Reference for no more support of 1.8.7 with ruby-install:
    # http://stackoverflow.com/questions/21891402/chruby-install-ruby-1-8-7
    # Install with ruby-build instead into the default folder where
    # chruby will find it:
    CC=gcc-4.8 ruby-build 1.8.7-p375 ~/.rubies/ruby-1.8.7-p375
  else
    ruby-install $ruby_version
  fi
done < $DIR/rubies.txt

chruby $(cat ~/.ruby-version)
gem install bundler
gem install rails
