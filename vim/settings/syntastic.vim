" ------------------------------------------------------------------------------
" Syntastic and related config
" ------------------------------------------------------------------------------
" let g:syntastic_check_on_save=1 " Check syntax on save using MRI
let g:syntastic_enable_signs=1 " Display syntax error markers in gutter
let g:syntastic_auto_jump=1 " Automatically jump to first error reported
" The warnings below don't really apply for Rails, so get rid of them
let g:syntastic_eruby_ruby_quiet_messages =
  \ {'regex': 'possibly useless use of a variable in void context'}
