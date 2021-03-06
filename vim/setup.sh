#!/bin/bash
# Configure vim, install plugins, and configure plugins if needed

# Execute vim without running a vimrc
vim +PluginInstall +qall

# Command-T requires compiling against the system Ruby
# If there are issues with Vim and Ruby, make the asdf system ruby point to
# the latest brew-installed version of Ruby:
# $ brew link --overwrite ruby
#
# Install process when new versions of brew vim are installed:
# $ cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t/
# $ make clean
# $ ruby extconf.rb
# $ make
#
# Helpful links:
# - https://superuser.com/questions/1096438/brew-upgrade-broke-vim-on-os-x-dyld-library-not-loaded
# - https://gist.github.com/paulfioravanti/f9a55eb1dbb0bac34254e89cc5b5bf7e
# Issues with ld flags:
# - https://github.com/wincent/command-t/issues/316
