#!/bin/bash
# Set up a new Mac to get up and running for development.
# Assumes that
# 1. XCode has been installed from the App Store.  Its presence is needed
#    for some of the brew packages, and agreement to the license is required
#    to compile some Ruby versions.
# 2. $ git clone https://github.com/paulfioravanti/dotfiles.git ~/.dotfiles
#    has been run. On a new machine, using `git` may prompt you to install XCode
#    command line tools, which is expected behaviour and okay to do if you
#    haven't installed XCode already.

# Get current directory
DIR=$(dirname $BASH_SOURCE)

# Install brew packages and casks
source $DIR/brew/brewfile.sh

# Bootstrap rcup: the exclusions here are enumerated in the rcrc file so
# you should be able to just run $ rcup when doing this again
# Ignores the README, brew, and ruby directory for symlinking
rcup -x README.md setup.sh *:brew *:ruby

# Apply new terminal settings
source ~/.bash_profile

# Install Vundle to get vim plugins defined in .vimrc up and running
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Get Solarized colors for iTerm. Follow up with installation manually.
git clone https://github.com/altercation/solarized.git ~/solarized

# Install Ruby versions
source $DIR/ruby/chruby.sh

# Manual Mac system settings follow-up tasks:
# 1. Under System Preferences > Keyboard > Modifier Keys:
#    - On the Caps Lock dropdown, select  "^ Control"
#      (This is preparation for the Karabiner step below)
#
# Manual App-related follow-up tasks:
# 1. Install Solarized colours into iTerm2 default profile
#    $ cd ~/solarized/iterm2-colors-solarized
#    $ open .
#    - Double click Solarized Dark.itermcolors and Solarized Light.itermcolors
#    to install them into iTerm2
#    - Delete the ~/solarized directory
# 2. Configure Karabiner to change Caps Lock to Ctrl/Esc
#    - Open Karabiner and allow it access to accessibility settings
#    - In the key remappings, under the Change Control_L_Key (Left Control)
#      settings, check:
#      - Control_L to Control_L (+ When you type Control_L only, send Escape)
