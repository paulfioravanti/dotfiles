#!/bin/bash
# Configure vim, install plugins, and configure plugins if needed

# Install Vundle to get vim plugins defined in .vimrc up and running
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Execute vim without running a vimrc
vim +PluginInstall +qall

# Command-T requires compiling against the system Ruby
chruby system
ruby -C ~/.vim/bundle/command-t/ruby/command-t/ext/command-t/ extconf.rb
make -C ~/.vim/bundle/command-t/ruby/command-t/ext/command-t/
