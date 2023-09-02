" ------------------------------------------------------------------------------
" NERDTree and related config
" ------------------------------------------------------------------------------
" Make sure relative line numbers are used.
autocmd FileType nerdtree setlocal relativenumber
" Make sure relative numbers re-appear when switching back to NERDTree
" from other windows.
autocmd BufEnter NERD_* setlocal rnu
" Enable line numbers
let g:NERDTreeShowLineNumbers = 1
" Display hidden files by default
let NERDTreeShowHidden = 1
" Case-sensitive sorting of filenames
let NERDTreeCaseSensitiveSort = 1
" Toggle NERDTree
nnoremap <Leader>f :NERDTreeFind<CR>

map <C-n> :NERDTreeToggle<CR>
" REF: https://stackoverflow.com/a/65743329/567863
" map <C-n> :call NERDTreeToggleAndRefresh()<CR>

" NOTE: WORKAROUND for https://github.com/preservim/nerdtree/issues/1321
" Remove this when that PR is fixed/merged.
let g:NERDTreeMinimalMenu=1

function NERDTreeToggleAndRefresh()
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  else
    :NERDTreeToggle
    :NERDTreeRefreshRoot
    :NERDTreeToggle
  endif
endfunction

" REF: https://github.com/preservim/nerdtree#frequently-asked-questions
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
