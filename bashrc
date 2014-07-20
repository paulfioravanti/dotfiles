# Don't check for mail on opening new terminal
unset MAILCHECK

# Git tab completion
source ~/git-completion.bash
# Show branch in status line
PS1='[\W$(__git_ps1 " (%s)")]$ '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

# Get ANSI colours in iTerm2
export CLICOLOR=1
# Set colors to match iTerm Terminal colours
export TERM=xterm-256color  

## PATH ##
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/sbin # Add sbin to PATH for icu4c
export PATH=$PATH:/usr/local/heroku/bin:$PATH # added by Heroku toolbelt
source /Users/paul/.travis/travis.sh # added by travis gem
PATH=$PATH:/usr/local/share/npm/bin # Add npm to PATH for bower
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export LSCOLORS=gxfxcxdxbxegedabagacad # give ls some colour
alias ls='ls -FAagG'
alias be='bundle exec'
