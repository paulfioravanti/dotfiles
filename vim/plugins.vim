" -----------------------------------------------------------------------------
"  Vim package manager (plug.vim)
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" NOTE: Only single quoted strings can be used for arguments to `Plug`.
" See: https://github.com/junegunn/vim-plug/issues/33

" Show git diff indicators in left gutter of screen
Plug 'airblade/vim-gitgutter'
" Solarized colour scheme for Vim
Plug 'altercation/vim-colors-solarized'
" Simplifies the transition between multiline and single-line code
" gS - to split a one-liner into multiple lines
" gJ - (with the cursor on the first line of a block) to join a block into a
" single-line statement.
Plug 'AndrewRadev/splitjoin.vim'
" Switch segments of text with predefined replacements
" eg true => false, { :foo => true  } => { foo: true  }
" Default mapping: gs
Plug 'AndrewRadev/switch.vim'
" Preview colours in source code while editing
Plug 'ap/vim-css-color'
" Vim plugin for Julia: Automatic docstring generation & code formatting
Plug 'AtsushiSakai/julia.vim'
" Tells Deckset to update it's preview window
Plug 'bwmcadams/vim-deckset'
" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'
" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'
" SonicPi plugin for Vim
" <leader>r - send buffer to sonicpi
" <leader>S - send stop message to sonicpi
Plug 'dermusikman/sonicpi.vim'
" Syntax highlighting for Elixir
Plug 'elixir-editors/vim-elixir'
" Syntax highlighting for Elm
Plug 'elmcast/elm-vim'
" Go development plugin for Vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Automatically insert or delete brackets, parens, quotes
Plug 'jiangmiao/auto-pairs'
" GraphQL file detection, syntax highlighting, and indentation
Plug 'jparise/vim-graphql'
" Toggle the cursor shape in the terminal for Vim
Plug 'jszakmeister/vim-togglecursor'
" Vim wrapper for Command-line fuzzy finder FZF
" (assumes install via Homebrew)
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Easy code alignment
" - vipga=
"     visual-select inner paragraph
"     Start EasyAlign command (ga)
"     Align around =
" - gaip=
"     Start EasyAlign command (ga) for inner paragraph
"     Align around =
Plug 'junegunn/vim-easy-align'
" CSS3 syntax (and syntax defined in some foreign specifications)
" support for Vim's built-in syntax/css.vim
Plug 'hail2u/vim-css3-syntax'
" Text objects for entire buffers
" vim-textobj-entire depends on vim-textobj-user
Plug 'kana/vim-textobj-entire'
" Text object for search matches
Plug 'kana/vim-textobj-lastpat'
" Create user-defined text objects
Plug 'kana/vim-textobj-user'
" Syntax, indenting, compiling of Coffeescript
Plug 'kchmck/vim-coffee-script'
" Vim runtime files for Swift
Plug 'keith/swift.vim'
" Vim syntax highlighting plugin for JSON with C-style line (//)
" and block (/* */) comments.
Plug 'kevinoid/vim-jsonc'
" Typescript syntax files for Vim
Plug 'leafgarland/typescript-vim'
" Expand abbreviations into html tags using Emmet
" https://github.com/mattn/emmet-vim/blob/master/TUTORIAL
Plug 'mattn/emmet-vim'
" Vim Haskell Brittany integration plugin
Plug 'meck/vim-brittany'
" Vim integration for the Elixir formatter.
Plug 'mhinz/vim-mix-format'
" Relative/Absolute line numbering for different modes
Plug 'myusuf3/numbers.vim'
" A vim 7.4+ plugin to generate table of contents for Markdown files.
" :GenTocGFM
Plug 'mzlogin/vim-markdown-toc'
" Highlight all trailing Whitespace characters
Plug 'ntpeters/vim-better-whitespace'
" HTML5 omnicomplete and syntax
Plug 'othree/html5.vim'
" Vastly improved Javascript indentation and syntax support in Vim
Plug 'pangloss/vim-javascript'
" Automate common Jekyll tasks from Vim
Plug 'parkr/vim-jekyll'
" React JSX syntax highlighting for vim and Typescript
Plug 'peitalin/vim-jsx-typescript'
" File tree browser
" C-n - Open NERDTree
Plug 'preservim/nerdtree'
" A vim plugin wrapper for prettier, pre-configured with custom default
" prettier settings.
" post install (yarn install | npm install) then load plugin only for editing
" supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" Reason Vim editor integration
Plug 'reasonml-editor/vim-reason-plus'
" Vim plugin for clang-format, a formatter for C, C++, Obj-C, Java, JavaScript,
" TypeScript and ProtoBuf.
Plug 'rhysd/vim-clang-format'
" Vim filetype and tools support for Crystal language
Plug 'rhysd/vim-crystal'
" Plug for Dash.app
" :Dash - will search for method under cursor in filetype's docset
" :Dash function_name - will search for named method in filetype's docset
Plug 'rizzatti/dash.vim'
" Rust file detection and syntax hightlighting
Plug 'rust-lang/rust.vim'
" .slim file syntax highlighting
Plug 'slim-template/vim-slim'
" Allows you to visually select increasingly larger regions of text using the
" same key combination.
" Press + to expand the visual selection and _ to shrink it.
Plug 'terryma/vim-expand-region'
" Work with variants of words
Plug 'tpope/vim-abolish'
" Vim wrapper around bundler
" :Bundle, which wraps bundle.
" An internalized version of bundle open: :Bopen (and :Bsplit, :Btabedit, etc.).
Plug 'tpope/vim-bundler'
" Commenting code
" gcc - Comment out one line of code
" gc + motion - Comment out target of motion
Plug 'tpope/vim-commentary'
" End Ruby structures automatically
Plug 'tpope/vim-endwise'
" Use Git in Vim
Plug 'tpope/vim-fugitive'
" Git-related syntax, highlight, filetype plugins
Plug 'tpope/vim-git'
" Runtime files for Haml and Sass
Plug 'tpope/vim-haml'
" Provides granular project configuration
Plug 'tpope/vim-projectionist'
" Mappings for various types of tags
Plug 'tpope/vim-ragtag'
" rails.vim
Plug 'tpope/vim-rails'
" Allow plugins to tap into the . command
Plug 'tpope/vim-repeat'
" Defaults everyone can agree on
Plug 'tpope/vim-sensible'
" Mappings for text 'surroundings'
" cs"' - change double to single quotes
" ds" - remove double quote delimiters
" ys + text object + surrounding - create surrounding on text object
Plug 'tpope/vim-surround'
" Bracket mappings for various commands
Plug 'tpope/vim-unimpaired'
" Status line for Vim
Plug 'vim-airline/vim-airline'
" Themes for Vim airline
Plug 'vim-airline/vim-airline-themes'
" Erlang indentation and syntax for Vim
Plug 'vim-erlang/vim-erlang-runtime'
" Config files for editing, compiling Ruby
Plug 'vim-ruby/vim-ruby'
" Change Ruby hash syntax to 1.9
" :ChangeHashSyntax - Changes hash syntax on entire file
Plug 'vim-scripts/change-hash-syntax'
" Vimscript library of common functions
Plug 'vim-scripts/ingo-library'
" Define a different filetype syntax on regions of a buffer
Plug 'vim-scripts/syntaxrange'
" Automatic syntax checking
Plug 'vim-syntastic/syntastic'
" Vim / Neovim plugin for preview PlantUML
" Run :PlantumlOpen to open previewer webpage in browser
Plug 'weirongxu/plantuml-previewer.vim'
" Copy syntax-highlighted code from vim to the OS X clipboard as RTF tex
" :CopyRTF
Plug 'zerowidth/vim-copy-as-rtf'

call plug#end()
