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
Plugin 'tpope/vim-unimpaired' " Bracket mappings for various commands
Plugin 'tpope/vim-repeat' " Allow plugins to tap into the . command
Plugin 'tpope/vim-bundler' " Vim wrapper around bundler
Plugin 'tpope/vim-endwise' " End Ruby structures automatically
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

" ----------------------------------------------------------------------------
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

set incsearch " Show search pattern as it is typed
set smartcase " Search case-sensitively if search string includes uppercase
set ignorecase     " searches are case insensitive
" Allows incsearch highlighting for range commands
" Intention is to be used in forward/backward searches ie
" /foo$t ?bar$m etc.  Idea from:
" reddit.com/r/vim/comments/1yfzg2/does_anyone_actually_use_easymotion/cfkaxw5
cnoremap $t <CR>:t''<CR> " Copy to position before last jump
cnoremap $m <CR>:m''<CR> " Move to position before last jump
cnoremap $d <CR>:d<CR>`` " Delete and move to position before last jump

" ----------------------------------------------------------------------------
"  Tags
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Displaying text
" ----------------------------------------------------------------------------
set number " show line numbers
" Enable powerline fonts in vim-airline (like the branch icon)
" I'm using Consolas font for powerline, set in the iTerm Profile text settings:
" https://github.com/runsisi/consolas-font-for-powerline
let g:airline_powerline_fonts=1
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
set encoding=utf-8
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
let g:airline#extensions#tabline#enabled = 1

" Reset colours for vim-gitgutter due to solarized overrides ie
" 1. Change the gutter background from grey to black
" 2. Clear the background color when signs appear
" 3. Set the foreground colours for each sign to be dark so they can be seen
highlight clear SignColumn
highlight SignColumn ctermfg=black
highlight GitGutterAdd ctermfg=darkgreen
highlight GitGutterChange ctermfg=darkyellow
highlight GitGutterDelete ctermfg=darkred
highlight GitGutterChangeDelete ctermfg=darkyellow
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
