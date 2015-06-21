#!/bin/bash

# Set up a new Mac to get up and running with development
DIR=`dirname $BASH_SOURCE`
source $DIR/brew/brewfile.sh

# Bootstrap rcup: the exclusions here are enumerated in the rcrc file so
# you should be able to just run $ rcup when doing this again
# Ignores the README and the brew directory for symlinking
rcup -x README.md *:brew
