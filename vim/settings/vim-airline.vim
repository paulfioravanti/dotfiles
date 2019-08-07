" ------------------------------------------------------------------------------
" vim-airline and related config
" ------------------------------------------------------------------------------
" Suppress default mode messages and just use vim-airline
set noshowmode
" Vim Airline decided to enable their "cursor-mode" extension by default,
" which messed up my solarized cursor completely, so explicitly disable it.
let g:airline#extensions#cursormode#enabled = 0
" Disable git branch display as it covers the filename, and I need to know
" that more often than the current git branch.
let g:airline#extensions#branch#enabled = 0
