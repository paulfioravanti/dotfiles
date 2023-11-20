" Run Elixir formatter every time Elixir file is saved.
" NOTE: Keep this off for the time being and run the formatter manually
" (:MixFormat) since there seems to be some weird issues around errors.
" (error windows opening up for no reason etc)
let g:mix_format_on_save = 1
" Set options for the formatter
let g:mix_format_options = ''
" Don't open a window containing the stacktrace on errors
let g:mix_format_silent_errors = 1
