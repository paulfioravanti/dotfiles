" -----------------------------------------------------------------------------
"  Vim package manager
" -----------------------------------------------------------------------------
filetype off " required by Vundle
" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin() " required by Vundle

" Show git diff indicators in left gutter of screen
Plugin 'airblade/vim-gitgutter'
" Solarized colour scheme for Vim
Plugin 'altercation/vim-colors-solarized'
" Simplifies the transition between multiline and single-line code
" gS - to split a one-liner into multiple lines
" gJ - (with the cursor on the first line of a block) to join a block into a
" single-line statement.
Plugin 'AndrewRadev/splitjoin.vim'
" Switch segments of text with predefined replacements
" eg true => false, { :foo => true  } => { foo: true  }
" Default mapping: gs
Plugin 'AndrewRadev/switch.vim'
 " Tells Deckset to update it's preview window
Plugin 'bwmcadams/vim-deckset'
" SonicPi plugin for Vim
" <leader>r - send buffer to sonicpi
" <leader>S - send stop message to sonicpi
Plugin 'dermusikman/sonicpi.vim'
" Syntax highlighting for Elixir
Plugin 'elixir-lang/vim-elixir'
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Automatically insert or delete brackets, parens, quotes
Plugin 'jiangmiao/auto-pairs'
" Easy code alignment
" - vipga=
"     visual-select inner paragraph
"     Start EasyAlign command (ga)
"     Align around =
" - gaip=
"     Start EasyAlign command (ga) for inner paragraph
"     Align around =
Plugin 'junegunn/vim-easy-align'
" Text objects for entire buffers
" vim-textobj-entire depends on vim-textobj-user
Plugin 'kana/vim-textobj-entire'
" Text object for search matches
Plugin 'kana/vim-textobj-lastpat'
" Create user-defined text objects
Plugin 'kana/vim-textobj-user'
" Syntax, indenting, compiling of Coffeescript
Plugin 'kchmck/vim-coffee-script'
" Expand abbreviations into html tags using Emmet
" https://github.com/mattn/emmet-vim/blob/master/TUTORIAL
Plugin 'mattn/emmet-vim'
" Relative/Absolute line numbering for different modes
Plugin 'myusuf3/numbers.vim'
" Highlight all trailing Whitespace characters
Plugin 'ntpeters/vim-better-whitespace'
" Analyze Ruby code for structural similarities
" <Leader>f - Run Flay
Plugin 'prophittcorey/vim-flay'
" Plugin for Dash.app
" :Dash - will search for method under cursor in filetype's docset
" :Dash function_name - will search for named method in filetype's docset
Plugin 'rizzatti/dash.vim'
" Ag/The Silver Searcher for text searching
" :Ag search_term
Plugin 'rking/ag.vim'
" Rust file detection and syntax hightlighting
Plugin 'rust-lang/rust.vim'
" File tree browser
" C-n - Open NERDTree
Plugin 'scrooloose/nerdtree'
" Automatic syntax checking
Plugin 'scrooloose/syntastic'
" .slim file syntax highlighting
Plugin 'slim-template/vim-slim'
" Allows you to visually select increasingly larger regions of text using the
" same key combination.
" Press + to expand the visual selection and _ to shrink it.
Plugin 'terryma/vim-expand-region'
" Work with variants of words
Plugin 'tpope/vim-abolish'
" Vim wrapper around bundler
" :Bundle, which wraps bundle.
" An internalized version of bundle open: :Bopen (and :Bsplit, :Btabedit, etc.).
Plugin 'tpope/vim-bundler'
" Commenting code
" gcc - Comment out one line of code
" gc + motion - Comment out target of motion
Plugin 'tpope/vim-commentary'
" End Ruby structures automatically
Plugin 'tpope/vim-endwise'
" Use Git in Vim
Plugin 'tpope/vim-fugitive'
" Git-related syntax, highlight, filetype plugins
Plugin 'tpope/vim-git'
" Runtime files for Haml and Sass
Plugin 'tpope/vim-haml'
" Syntax highlighting, matching rules, mappings
Plugin 'tpope/vim-markdown'
" Mappings for various types of tags
Plugin 'tpope/vim-ragtag'
" rails.vim
Plugin 'tpope/vim-rails'
" Allow plugins to tap into the . command
Plugin 'tpope/vim-repeat'
" Defaults everyone can agree on
Plugin 'tpope/vim-sensible'
" Mappings for text 'surroundings'
" cs"' - change double to single quotes
" ds" - remove double quote delimiters
" ys + text object + surrounding - create surrounding on text object
Plugin 'tpope/vim-surround'
" Bracket mappings for various commands
Plugin 'tpope/vim-unimpaired'
" Status line for Vim
Plugin 'vim-airline/vim-airline'
" Themes for Vim airline
Plugin 'vim-airline/vim-airline-themes'
" Config files for editing, compiling Ruby
Plugin 'vim-ruby/vim-ruby'
" Change Ruby hash syntax to 1.9
" :ChangeHashSyntax - Changes hash syntax on entire file
Plugin 'vim-scripts/change-hash-syntax'
" Vimscript library of common functions
Plugin 'vim-scripts/ingo-library'
" Define a different filetype syntax on regions of a buffer
Plugin 'vim-scripts/syntaxrange'
" Fast Sublime Text-style file searching
" <Leader>t - Bring up fuzzy search
Plugin 'wincent/command-t'
" Copy syntax-highlighted code from vim to the OS X clipboard as RTF tex
" :CopyRTF
Plugin 'zerowidth/vim-copy-as-rtf'

call vundle#end() " required by Vundle

" Turn on Filetype detection, plugins, indentation; required by Vundle
filetype plugin indent on
