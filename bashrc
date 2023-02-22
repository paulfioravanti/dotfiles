#!/bin/sh
# Don't check for mail on opening new terminal
unset MAILCHECK

# Get ANSI colours in iTerm2
export CLICOLOR=1
# Set colors to match iTerm Terminal colours
export TERM=xterm-256color
# Declare vim to be the default editor
export EDITOR=vim
# Give ls some colour
export LSCOLORS=gxfxcxdxbxegedabagacad
# Enable IEx shell history
export ERL_AFLAGS="-kernel shell_history enabled"
# Enable call outs to scripts in steno command dictionaries.
export STENO_DICTIONARIES="$HOME/steno/steno-dictionaries"

## Dotenv
set -o allexport
source "$HOME/.env"
set +o allexport

## PATH ##
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/usr/local/sbin" # Add sbin to PATH for icu4c
export PATH="$PATH:/usr/local/heroku/bin:$PATH" # added by Heroku toolbelt
PATH=$PATH:/usr/local/share/npm/bin # Add npm to PATH for bower

## Aliases ##
export LSCOLORS=gxfxcxdxbxegedabagacad # give ls some colour
alias ls='ls -FlAagG' # more detail with default `ls`
alias be='bundle exec'
alias git=hub # use git to execute hub commands as well
alias mux=tmuxinator

# Allow <C-s> to be used by Command-T in Vim
# http://stackoverflow.com/q/8616843/567863
stty -ixon -ixoff

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
