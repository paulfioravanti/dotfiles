# Path to your oh-my-zsh installation.
export ZSH=/Users/paul/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="paulfioravanti"

# Which plugins would you like to load?
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  brew
  bundler
  chruby
  fasd
  git
  git-open
  gitfast
  github
  osx
  rails
  rake
  ruby
  tmux
  tmuxinator
  z
)

# User configuration

export PATH="/Users/paul/.gem/ruby/2.3.1/bin:/Users/paul/.rubies/ruby-2.3.1/lib/ruby/gems/2.3.0/bin:/Users/paul/.rubies/ruby-2.3.1/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/heroku/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/opt/gnupg@2.1/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Get ANSI colours in iTerm2
export CLICOLOR=1
# Set colors to match iTerm2 Terminal colours
export TERM=xterm-256color
# Declare vim to be the default editor
export EDITOR=vim
# Give ls some colour
export LSCOLORS=gxfxcxdxbxegedabagacad

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls -FlAagG' # more detail with default `ls`
alias git=hub # use git to execute hub commands as well
# delete all local branches that have been merged into master, excluding current branch, develop, and master
alias gsweep='git branch --merged master | command grep -vE "^(\*|\s*develop\s*|\s*master\s*$)" | command xargs -n 1 git branch -d'
# For whatever reason, the mux alias built into tmuxinator doesn't seem to
# be working, so just set it manually
alias mux=tmuxinator
# One command to update all develop dependencies
alias update='bubu && brew cu --yes && mas upgrade && gem update && gem cleanup && vim +PluginUpdate +qall'

# Allow <C-s> to be used by Command-T in Vim
# http://stackoverflow.com/q/8616843/567863
stty -ixon -ixoff

# Functions

# Checks to see whether there is a binstub in the working directory
# for rspec and uses it.  If not, it falls back to normal behaviour.
# NOTE: Currently not working: returns the error
# compdef: unknown command or service: rspec
# function _rspec_command() {
#   if [ -e "bin/rspec" ]; then
#     bin/rspec $@
#   else
#     command rspec $@
#   fi
# }
# alias rspec='_rspec_command'
# compdef _rspec_command=rspec

# Reinteractive OpsCare sentinel tool
[[ -f ~/.sentinel/current/bin/sentinel ]] && eval "$(~/.sentinel/current/bin/sentinel init -)"

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
