" ------------------------------------------------------------------------------
"  Command-T and related configuration
" ------------------------------------------------------------------------------
if &term =~ "xterm" || &term =~ "screen"
  " Ensure Escape key can close the match listing in Command-T
  let g:CommandTCancelMap = ['<ESC>', '<C-c>']
  " Ensure <C-j> and <C-k> can move up and down a list of file matches
  let g:CommandTSelectNextMap = ['<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-k>', '<ESC>OA']
endif
" It seems that using Command T with mvim isn't quite working with regards
" to ignoring all files under a specific folder that I would expect,
" so provide some extra specific config to do that ignoring.
let g:CommandTWildIgnore = &wildignore . '
  \,*/_build,
  \,*/assets/node_modules
  \,*/deps
  \,*/elm-stuff
  \'
