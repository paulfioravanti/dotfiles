" Headings based on Vim :options

" ----------------------------------------------------------------------------
"  Vim package manager
" ----------------------------------------------------------------------------
set nocompatible              " choose no compatibility with legacy vi
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'tpope/vim-sensible' " Defaults everyone can agree on
Plugin 'tpope/vim-git' " Git-related syntax, highlight, filetype plugins
Plugin 'tpope/vim-fugitive' " Use Git in Vim
Plugin 'tpope/vim-haml' " Runtime files for Haml and Sass
Plugin 'tpope/vim-markdown' " Syntax highlighting, matching rules, mappings
Plugin 'tpope/vim-rails' " rails.vim
Plugin 'tpope/vim-commentary' " Commenting code
Plugin 'tpope/vim-surround' " Mappings for text 'surroundings'
Plugin 'wincent/command-t' " Fast Sublime Text-style file searching
Plugin 'vim-ruby/vim-ruby' " Config files for editing, compiling Ruby
Plugin 'altercation/vim-colors-solarized' " Solarized colour scheme
" vim-textobj-entire depends on vim-textobj-user
Plugin 'kana/vim-textobj-user' " Create your own text objects
Plugin 'kana/vim-textobj-entire' " Text objects for entire buffers
Plugin 'kchmck/vim-coffee-script' " Syntax, indenting, compiling of Coffeescript
Plugin 'bling/vim-airline' " Status line
Plugin 'airblade/vim-gitgutter' " Show git diff in left 'gutter'

call vundle#end()            " required
filetype plugin indent on " Turn on Filetype detection, plugins, indentation

"  Moving around, searching and patterns
" ----------------------------------------------------------------------------
if &term =~ "xterm" || &term =~ "screen"
  " Ensure Escape key can close the match listing in Command-T
  let g:CommandTCancelMap = ['<ESC>', '<C-c>']
  " Ensure <C-j> and <C-k> can move up and down a list of file matches
  let g:CommandTSelectNextMap = ['<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-k>', '<ESC>OA']
endif

" Allow easier moving between split tabs
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ----------------------------------------------------------------------------
"  Tags
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Displaying text
" ----------------------------------------------------------------------------
set number " show line numbers

" ----------------------------------------------------------------------------
"  Syntax, highlighting and spelling
" ----------------------------------------------------------------------------
syntax enable " Turn on syntax highlighting
set background=dark
colorscheme solarized

set cursorline " Highlight current line
augroup CursorLine " Only highlight cursor line in current window
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set colorcolumn=81 " display colour column at 81 characters
highlight ColorColumn ctermbg=238 " make colorcolumn a light grey

set hlsearch       " highlight matches
set ignorecase     " searches are case insensitive

" 1. Highlight trailing whitespace in red
" 2. Don't show highlighting in insert mode
" 3. Have highlighting apply when new buffers opened
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" ----------------------------------------------------------------------------
"  Multiple windows
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Multiple tab pages
" ----------------------------------------------------------------------------
set splitbelow
set splitright
" ----------------------------------------------------------------------------
"  Terminal
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Using the mouse
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  GUI
"  Set these options in .gvimrc
"  See help for 'setting-guifont' for tips on how to set guifont on Mac/Windows
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Printing
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Messages and info
" ----------------------------------------------------------------------------
set noshowmode " Suppress default mode messages and just use vim-airline
" ----------------------------------------------------------------------------
"  Selecting text
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Editing text
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Tabs and indenting
" ----------------------------------------------------------------------------
" Tabs are spaces and indents are 2 spaces
set expandtab
set shiftwidth=2
" ----------------------------------------------------------------------------
"  Folding
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Diff mode
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Mapping
" ----------------------------------------------------------------------------
let mapleader = "," " Map leader key to comma from slash
xnoremap . :normal .<CR> " Enable dot command in Visual Mode
" Enable a macro to be executed over a visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" ----------------------------------------------------------------------------
"  Reading and writing files
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  The swap file
" ----------------------------------------------------------------------------
set nobackup " no backup files
set noswapfile " no swap files
" ----------------------------------------------------------------------------
"  Command line editing
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Executing external commands
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Running make and jumping to errors
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Language specific
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Multi-byte characters
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Various
" ----------------------------------------------------------------------------
set nrformats= " treat all numerals as decimal and not octal etc
set visualbell " disable system bell and have cursor flash on errors
" ----------------------------------------------------------------------------
" Autocmds
" ----------------------------------------------------------------------------
