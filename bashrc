# Don't check for mail on opening new terminal
unset MAILCHECK

# Enable git tab completion via homebrew
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi
# Enable git status in prompt via homebrew
if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
  . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
  # Show branch in status line
  PS1='[\W$(__git_ps1 " (%s)")]$ '
  export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
fi

# Get ANSI colours in iTerm2
export CLICOLOR=1
# Set colors to match iTerm Terminal colours
export TERM=xterm-256color
# Declare a default editor
export EDITOR=vim

## PATH ##
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/sbin # Add sbin to PATH for icu4c
export PATH=$PATH:/usr/local/heroku/bin:$PATH # added by Heroku toolbelt
PATH=$PATH:/usr/local/share/npm/bin # Add npm to PATH for bower
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export LSCOLORS=gxfxcxdxbxegedabagacad # give ls some colour
alias ls='ls -FlAagG'
alias be='bundle exec'
alias git=hub # use git to execute hub commands as well

# Allow <C-s> to be used by Command-T in Vim
# http://stackoverflow.com/q/8616843/567863
stty -ixon -ixoff
