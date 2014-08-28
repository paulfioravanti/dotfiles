" -----------------------------------------------------------------------------
"  Vim package manager
" -----------------------------------------------------------------------------
filetype off " required by Vundle
" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin() " required by Vundle

Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'tpope/vim-sensible' " Defaults everyone can agree on
Plugin 'tpope/vim-git' " Git-related syntax, highlight, filetype plugins
Plugin 'tpope/vim-fugitive' " Use Git in Vim
Plugin 'tpope/vim-haml' " Runtime files for Haml and Sass
Plugin 'tpope/vim-markdown' " Syntax highlighting, matching rules, mappings
Plugin 'tpope/vim-rails' " rails.vim
Plugin 'tpope/vim-commentary' " Commenting code
Plugin 'tpope/vim-surround' " Mappings for text 'surroundings'
Plugin 'tpope/vim-unimpaired' " Bracket mappings for various commands
Plugin 'tpope/vim-repeat' " Allow plugins to tap into the . command
Plugin 'tpope/vim-bundler' " Vim wrapper around bundler
Plugin 'tpope/vim-endwise' " End Ruby structures automatically
Plugin 'tpope/vim-abolish' " Work with variants of words
Plugin 'wincent/command-t' " Fast Sublime Text-style file searching
Plugin 'rking/ag.vim' " Ag/The Silver Searcher for text searching
Plugin 'vim-ruby/vim-ruby' " Config files for editing, compiling Ruby
Plugin 'altercation/vim-colors-solarized' " Solarized colour scheme
" vim-textobj-entire depends on vim-textobj-user
Plugin 'kana/vim-textobj-user' " Create your own text objects
Plugin 'kana/vim-textobj-entire' " Text objects for entire buffers
Plugin 'kana/vim-textobj-lastpat' " Text object for search matches
Plugin 'kchmck/vim-coffee-script' " Syntax, indenting, compiling of Coffeescript
Plugin 'bling/vim-airline' " Status line
Plugin 'airblade/vim-gitgutter' " Show git diff in left 'gutter'
Plugin 'rizzatti/dash.vim' " Plugin for Dash.app
Plugin 'vim-scripts/change-hash-syntax' " Change Ruby hash syntax to 1.9
Plugin 'scrooloose/syntastic' " Syntax checking
Plugin 'myusuf3/numbers.vim' " Relative/Absolute numbering for different modes
Plugin 'ntpeters/vim-better-whitespace' " Whitespace handling
Plugin 'scrooloose/nerdtree' " File tree browser

call vundle#end() " required by Vundle

" Turn on Filetype detection, plugins, indentation; required by Vundle
filetype plugin indent on
