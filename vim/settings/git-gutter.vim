" ------------------------------------------------------------------------------
" Git-gutter and related config
" ------------------------------------------------------------------------------
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
