" NOTE: This was added specifically for stenography usage in txt files.
" No need to have code-style indenting or tabbing, so override those sensible
" settings.
if &ft =~ 'text'
  set noautoindent
  set nosmarttab
endif
