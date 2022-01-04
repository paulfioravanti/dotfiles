let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules|log|tmp)$',
  \ 'file': '\v\.(exe|so|dll|DS_Store)$',
  \ }

" REF: https://github.com/ctrlpvim/ctrlp.vim/issues/196#issuecomment-192541449
let g:ctrlp_abbrev = {
  \'gmode': 'i',
  \'abbrevs': [
    \{
      \'pattern': ' ',
      \'expanded': '',
      \'mode': 'pfrz',
    \}
  \]
\}

map <leader>C :CtrlPClearCache<cr>
