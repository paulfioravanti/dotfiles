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
  asdf
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

# zsh-specific config:
# https://superuser.com/questions/598810/zsh-config-to-export-or-not-to-export/598924#598924
path=(
  $path
  /Users/paul/.asdf/installs/nodejs/8.3.0/.npm/bin
  /Users/paul/.gem/ruby/2.4.1/bin
  /usr/local/bin
  /usr/local/heroku/bin
  /usr/local/share/npm/bin
  /usr/local/sbin
  /usr/bin
  /usr/sbin
  /sbin
  /bin
)
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
# Enable IEx shell history
export ERL_AFLAGS="-kernel shell_history enabled"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="ls -FlAagG" # more detail with default `ls`
alias git=hub # use git to execute hub commands as well
# delete all local branches that have been merged into master, excluding current branch, develop, and master
alias gsweep='git branch --merged master | command grep -vE "^(\*|\s*develop\s*|\s*master\s*$)" | command xargs -n 1 git branch -d'
# For whatever reason, the mux alias built into tmuxinator doesn't seem to
# be working, so just set it manually
alias mux=tmuxinator
# In order to do things like find . -name "*.ex" | map wc -l
alias map="xargs -n1"
# Rather than use system Vim 7.4, use MacVim 8 in "vi mode", which enables
# keeping Command-T compiled with system Ruby, and access to Clipboard, which
# system Vim doesn't have(!)
alias vim="mvim -v"
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

# One function to update all development dependencies
function update() {
  red=$(tput setaf 1)
  green=$(tput setaf 2)
  yellow=$(tput setaf 3)
  reset=$(tput sgr0)


  cd ~
  echo "${yellow}Running Brew updates...${reset}"
  if bubu; then
    echo "${green}Brew updates done.${reset}"
  else
    echo "${red}Brew updates failed.${reset}"
  fi

  echo "${yellow}Running Brew Cask updates...${reset}"
  # https://github.com/buo/homebrew-cask-upgrade#usage
  if brew cu --all --cleanup --force --yes && brew cask cleanup; then
    echo "${green}Brew Cask updates done.${reset}"
  else
    echo "${red}Brew Cask updates failed.${reset}"
  fi

  echo "${yellow}Running Brew Bundle updates...${reset}"
  if brew bundle dump --force && brew bundle; then
    echo "${green}Brew Bundle updates done.${reset}"
  else
    echo "${red}Brew Bundle updates failed.${reset}"
  fi

  echo "${yellow}Running ASDF updates...${reset}"
  if asdf update && asdf plugin-update --all; then
    echo "${green}ASDF updates done.${reset}"
  else
    echo "${red}ASDF updates failed.${reset}"
  fi

  echo "${yellow}Running App Store updates...${reset}"
  if mas upgrade; then
    echo "${green}App Store updates done.${reset}"
  else
    echo "${red}App Store updates failed.${reset}"
  fi

  echo "${yellow}Running Ruby gem updates...${reset}"
  if gem update && gem cleanup; then
    echo "${green}Ruby gem updates done.${reset}"
  else
    echo "${red}Ruby gem updates failed.${reset}"
  fi

  echo "${yellow}Running Vim plugin updates...${reset}"
  if vim +PluginUpdate +qall; then
    echo "${green}Vim plugin updates done.${reset}"
  else
    echo "${red}Vim plugin updates failed.${reset}"
  fi
}

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

. $HOME/.asdf/asdf.sh
