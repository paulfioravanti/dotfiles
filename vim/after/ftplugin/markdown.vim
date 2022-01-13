" Issues currently exist for Markdown highlighting in Vim, so until there is
" an update, turn it off.
autocmd FileType markdown match none

" Force linebreaks for text at 80 characters
setlocal textwidth=80
setlocal formatoptions+=t
