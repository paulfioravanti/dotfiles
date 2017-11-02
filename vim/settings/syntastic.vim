" ------------------------------------------------------------------------------
" Syntastic and related config
" ------------------------------------------------------------------------------
" Check syntax on save using MRI
" let g:syntastic_check_on_save=1
" Display syntax error markers in gutter
let g:syntastic_enable_signs=1
" Automatically jump to first error reported
let g:syntastic_auto_jump=1
" The warnings below don't really apply for Rails, so get rid of them
let g:syntastic_eruby_ruby_quiet_messages =
  \ {"regex": "possibly useless use of a variable in void context"}
let g:syntastic_ruby_mri_quiet_messages =
  \ {"regex": "possibly useless use of a variable in void context"}
" Syntastic shows errors in scss files as it doesn't know about about
" additional import paths set up by sprockets or other libraries.
" If the files aren't found, the app will error, so I don't need
" Syntastic to prompt me.
let g:syntastic_scss_sass_quiet_messages =
  \ { "regex": "File to import not found or unreadable" }
" Recommended settings for Elm
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1
" Only check certain files if you explicitly run :SyntasticCheck
" This was done due to syntax issues being brought up with HTML files
" with Jekyll syntax in them, and issues with scss @import statements.
" https://github.com/vim-syntastic/syntastic/issues/240#issuecomment-12957317
let syntastic_mode_map = { 'passive_filetypes': ['html', 'scss'] }
