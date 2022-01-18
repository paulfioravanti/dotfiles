" Issues currently exist for Markdown highlighting in Vim, so until there is
" an update, turn it off.
autocmd FileType markdown match none
" Make the background colour of italicised Markdown elements a different
" colour than the cursor so the cursor can actually be seen when moving over
" characters
autocmd FileType markdown highlight htmlItalic ctermfg=243
" Set spellcheck on Markdown files
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_au
highlight SpellBad cterm=underline ctermfg=red
set complete+=kspell

" Force linebreaks for text at 80 characters
setlocal textwidth=80
setlocal formatoptions+=t
