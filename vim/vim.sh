#!/bin/bash
# Configure vim, install plugins, and configure plugins if needed

# Install Vundle to get vim plugins defined in .vimrc up and running
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Execute vim without running a vimrc
vim +PluginInstall +qall -u NONE

# Command-T requires compiling against the system Ruby
chruby system
ruby ~/.vim/bundle/command-t/ruby/command-t/extconf.rb
make -C ~/.vim/bundle/command-t/ruby/command-t/
