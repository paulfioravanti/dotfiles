execute pathogen#infect()
syntax enable
colorscheme solarized
set background=dark
set number
set ruler
filetype plugin indent on
let mapleader = ","
" Ensure Escape key can close the match listing in Command-T
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-k>', '<ESC>OA']
endif
set colorcolumn=80
" Enable dot command in Visual Mode
xnoremap . :normal .<CR> 
" Enable a macro to be executed over a visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
