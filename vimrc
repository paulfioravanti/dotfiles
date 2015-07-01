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
" Map reverse character search to backslash
noremap \ ,
set encoding=utf-8
set number " show line numbers
set gcr=a:blinkon0 " Disable cursor blinking
set visualbell " disable system bell and have cursor flash on errors
set autoread " Reload file changes outside Vim
set nrformats= " treat all numerals as decimal and not octal etc
set splitbelow " Make horizonal splits split below
set splitright " Make vertical splits split to the right
set showbreak=↪ " Indicate linebreaks at the beginning of broken lines

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

set wildmenu " enhanced command-line completion
set wildignore+=.git " Don't include vcs files
set wildignore+=*.DS_Store " Don't include OSX-specific files in wildcards
set wildignore+=coverage/** " Don't include code coverage files in wildcards
set wildignore+=build/** " Don't include any Rubymotion build files
set wildignore+=tmp/cache/** " Don't include any Rails cache files
set wildignore+=docs/** " Don't include any files under docs/
set wildignore+=_build/** " Don't include Elixir Phoenix _build files
set wildignore+=node_modules/** " Don't include node_modules files
set wildignore+=deps/** " Don't include Elixir Phoenix deps files

" Save when losing focus from the window
au FocusLost * :silent! wall
" Resize splits when the window is resized
au VimResized * :wincmd =

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
set ignorecase " searches are case insensitive
set infercase " adjust autocomplete words depending on typed text
set incsearch " Show search pattern as it is typed
set hlsearch " Highlight searches
" Clear all search matches
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Allows incsearch highlighting for range commands
" Intention is to be used in forward/backward searches ie
" /foo$t ?bar$m etc.  Idea from:
" reddit.com/r/vim/comments/1yfzg2/does_anyone_actually_use_easymotion/cfkaxw5
cnoremap $t <CR>:t''<CR> " Copy to position before last jump
cnoremap $m <CR>:m''<CR> " Move to position before last jump
cnoremap $d <CR>:d<CR>`` " Delete and move back to position before last jump

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Show count of matches for the current search
nnoremap <leader>c :%s///gn<CR>

" ==============================================================================
"  Syntax, highlighting and spelling
" ==============================================================================
set background=dark
" If solarized hasn't been installed, suppress error.
" This was added due to using vim in setup scripts
" before vim plugins have been installed
silent! colorscheme solarized

set cursorline " Highlight current line
augroup CursorLine " Only highlight cursor line in current window
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set colorcolumn=81 " display colour column at 81 characters
highlight ColorColumn ctermbg=238 " make colorcolumn a light grey

" Clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Make Vim return to the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     execute 'normal! g`"zvzz' |
    \ endif
augroup END

" ==============================================================================
"  Mapping
" ==============================================================================
" Enable dot command in Visual Mode
xnoremap . :normal .<CR>
" Enable a macro to be executed over a visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Edit vimrc whenever I need to
nnoremap <leader>ev :vsplit ~/.vimrc<cr>

" Add emacs/shell bindings in command mode for beginning/end of command
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Toggleable indent highlighting with <Leader>I
let g:indentguides_state = 0
function! IndentGuides()
  if g:indentguides_state
    let g:indentguides_state = 0
    2match None
  else
    let g:indentguides_state = 1
    execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
  endif
endfunction
highlight def IndentGuides ctermbg=238
nnoremap <leader>I :call IndentGuides()<cr>

" Change cursor shape depending on mode: block for normal, line for insert.
" tmux will only forward escape sequences to the terminal if surrounded by
" a DCS sequence: https://gist.github.com/andyfowler/1195581
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" <C-z> is awkward to reach
nnoremap <leader>z <C-z>

" Pro Mode: Don't use those arrow keys
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" ==============================================================================
" Load plugin and custom settings
" ==============================================================================
for setting in split(globpath('~/.vim/settings', '*.vim'), '\n')
  exe 'source' setting
endfor
