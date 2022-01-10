" NOTE: This was added specifically for stenography usage in txt files.
" No need to have code-style indenting or tabbing, so override those sensible
" settings.
if &filetype =~ 'text'
  filetype plugin indent off
  set noautoindent
  set nosmarttab
endif
