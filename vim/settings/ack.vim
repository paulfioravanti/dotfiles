" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif
let g:ack_default_options =
  \ " -s -H --nocolor --nogroup --column --smart-case --follow"
