" .vimrc
" Author: Paul Fioravanti <paul.fioravanti@gmail.com>
" Source: https://github.com/paulfioravanti/dotfiles/blob/master/vimrc

" Use Vim settings rather than Vi
set nocompatible

" ======================================================================
" General Config
" ======================================================================
" Enable buffers to exist in the background without being in a window
set hidden
" Enable user configured syntax highlighting and turn on syntax
syntax enable
" Map leader key from slash to comma
let mapleader = ","
" Map reverse character search to backslash
noremap \ ,
set encoding=utf-8
" show line numbers
set number
" Disable cursor blinking
set gcr=a:blinkon0
" disable system bell and have cursor flash on errors
set visualbell
" Reload file changes outside Vim
set autoread
" treat all numerals as decimal and not octal etc
set nrformats=
" Make horizonal splits split below
set splitbelow
" Make vertical splits split to the right
set splitright

set autoindent
set smartindent
set smarttab
" Tab characters are two spaces wide
set tabstop=2
" Fine tunes amount of whitespace to be inserted
set softtabstop=2
" Default indent of two spaces
set shiftwidth=2
" Make tabs insert spaces
set expandtab

" no swap files
set noswapfile
" no backup files
set nobackup
" no making a backup before overwriting a file
set nowritebackup

" Report terminal type
set term=xterm-256color

" enhanced command-line completion
set wildmenu
" Don't include any compiled beam files from Elixir
set wildignore+=*.beam
" Don't include OSX-specific files
set wildignore+=*.DS_Store
" Don't include vcs files
set wildignore+=.git
" Don't include .keep files
set wildignore+=*.keep
" Don't include Elixir _build files
set wildignore+=*/_build/**
" Don't include Jekyll site files
set wildignore+=*/_site/**
" Don't include Python cache files
set wildignore+=__pycache__
" Don't include any Rubymotion build files
set wildignore+=*/build/**
" Don't include code coverage files
set wildignore+=*/coverage/**
" Don't include Elixir Phoenix deps files
set wildignore+=*/deps/**
" Don't include any files under docs/
set wildignore+=docs/**
" Don't include Elm vendor modules
set wildignore+=*/elm-stuff/**
" Don't include node_modules files
set wildignore+=*/node_modules/**
" Don't include locally uploaded files in Rails apps
set wildignore+=*/public/uploads/**
" Don't include any Rails cache files
set wildignore+=*/tmp/cache/**
" Don't include Rails cached vendor files
set wildignore+=*/vendor/cache/**
" Don't include JS generated code
set wildignore+=*/generated/**

" Save when losing focus from the window
au FocusLost * :silent! wall
" Resize splits when the window is resized
au VimResized * :wincmd =

" ======================================================================
" Plugin Initialisation
" ======================================================================
" Loads all plugins specified under ~/.vim/plugins.vim
" Currently uses plug.vim to manage all other plugins
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

" =====================================================================
"  Moving around, searching and patterns
" ======================================================================
" Search case-sensitively if search string includes uppercase
set smartcase
" searches are case insensitive
set ignorecase
" adjust autocomplete words depending on typed text
set infercase
" Show search pattern as it is typed
set incsearch
" Highlight searches
set hlsearch
" Clear all search matches
noremap <silent> <leader><space> :nohlsearch<cr>:call clearmatches()<cr>

" Allows incsearch highlighting for range commands
" Intention is to be used in forward/backward searches ie
" /foo$t ?bar$m etc.  Idea from:
" reddit.com/r/vim/comments/1yfzg2/does_anyone_actually_use_easymotion/cfkaxw5
cnoremap $t <CR>:t''<CR> " Copy to position before last jump
cnoremap $m <CR>:m''<CR> " Move to position before last jump
" Delete and move back to position before last jump
cnoremap $d <CR>:d<CR>``

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Show count of matches for the current search
nnoremap <leader>c :%s///gn<CR>

" ======================================================================
"  Syntax, highlighting and spelling
" ======================================================================
set background=dark
" If solarized hasn't been installed, suppress error.
" This was added due to using vim in setup scripts
" before vim plugins have been installed
silent! colorscheme solarized
" Make the background colour of italicised Markdown elements a different
" colour than the cursor so the cursor can actually be seen when moving over
" characters
autocmd FileType markdown highlight htmlItalic ctermfg=243

" Set spellcheck on Markdown files
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_au
highlight SpellBad cterm=underline ctermfg=red
set complete+=kspell

" Highlight current line
set cursorline
" Only highlight cursor line in current window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" display colour column at 81 characters
set colorcolumn=81
" make colorcolumn a light grey
highlight ColorColumn ctermbg=238

" Clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<CR>:let @/=''<CR>`z

" Make Vim return to the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     execute 'normal! g`"zvzz' |
    \ endif
augroup END

" ======================================================================
"  Mapping
" ======================================================================
" Enable dot command in Visual Mode
xnoremap . :normal .<CR>
" Enable a macro to be executed over a visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Edit vimrc whenever I need to
nnoremap <leader>ev :vsplit ~/.vimrc<CR>

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

" Don't lose selection on indenting
vnoremap > >gv
vnoremap < <gv

" ======================================================================
" Workarounds/Hacks
" ======================================================================

" The t_RV (request terminal version string for xterm) needs to be blanked
" out in order to suppress output in the Hyper terminal when starting
" Vim.  More information on this strange issue at the following links:
" - https://github.com/zeit/hyper/issues/1037
" - https://github.com/vim-airline/vim-airline/issues/393
set t_RV=

" ======================================================================
" Load plugin and custom settings
" ======================================================================
for setting in split(globpath('~/.vim/settings', '*.vim'), '\n')
  exe 'source' setting
endfor
