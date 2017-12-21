" ------------------------------------------------------------------------------
" NERDTree and related config
" ------------------------------------------------------------------------------
" Enable line numbers
let g:NERDTreeShowLineNumbers = 1
" Make sure relative line numbers are used.
autocmd FileType nerdtree setlocal relativenumber
" Make sure relative numbers re-appear when switching back to NERDTree
" from other windows.
autocmd BufEnter NERD_* setlocal rnu
" Display hidden files by default
let NERDTreeShowHidden=1
