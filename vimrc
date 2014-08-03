" .vimrc
" Author: Paul Fioravanti <paul.fioravanti@gmail.com>
" Source: https://github.com/paulfioravanti/dotfiles/blob/master/vimrc

set nocompatible " Use Vim settings rather than Vi

" ==============================================================================
" General Config
" ==============================================================================
set hidden " Enable buffers to exist in the background without being in a window
syntax enable " Enable user configured syntax highlighting and turn on syntax
let mapleader = "," " Map leader key from slash to comma
set encoding=utf-8
set number " show line numbers
set gcr=a:blinkon0 " Disable cursor blinking
set visualbell " disable system bell and have cursor flash on errors
set autoread " Reload file changes outside Vim
set nrformats= " treat all numerals as decimal and not octal etc
set splitbelow " Make horizonal splits split below
set splitright " Make vertical splits split to the right

set autoindent
set smartindent
set smarttab
set expandtab " Make tabs insert spaces
set shiftwidth=2 " Default indent of two spaces
set softtabstop=2
set tabstop=2

set noswapfile " no swap files
set nobackup " no backup files
set nowritebackup " no making a backup before overwriting a file

" ==============================================================================
" Plugin Initialisation
" ==============================================================================
" Loads all plugins specified under ~/.vim/plugins.vim
" Currently uses Vundle to manage all other plugins
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

" ==============================================================================
"  Moving around, searching and patterns
" ==============================================================================
" Allow easier moving between split tabs
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set smartcase " Search case-sensitively if search string includes uppercase
set ignorecase     " searches are case insensitive
set incsearch " Show search pattern as it is typed
" Allows incsearch highlighting for range commands
" Intention is to be used in forward/backward searches ie
" /foo$t ?bar$m etc.  Idea from:
" reddit.com/r/vim/comments/1yfzg2/does_anyone_actually_use_easymotion/cfkaxw5
cnoremap $t <CR>:t''<CR> " Copy to position before last jump
cnoremap $m <CR>:m''<CR> " Move to position before last jump
cnoremap $d <CR>:d<CR>`` " Delete and move back to position before last jump

" ==============================================================================
"  Syntax, highlighting and spelling
" ==============================================================================
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

" ==============================================================================
"  Mapping
" ==============================================================================
xnoremap . :normal .<CR> " Enable dot command in Visual Mode
" Enable a macro to be executed over a visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" ==============================================================================
" Load plugin and custom settings
" ==============================================================================
for setting in split(globpath('~/.vim/settings', '*.vim'), '\n')
  exe 'source' setting
endfor
