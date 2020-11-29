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
  fasd
  git
  git-open
  # not sure what happened here, but this started causing pipe errors
  # all of a sudden, rendering *all* terminals unusable.
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
typeset -U path
path=(
  /usr/local/bin
  /usr/local/heroku/bin
  /usr/local/share/npm/bin
  /usr/local/sbin
  /usr/bin
  /usr/sbin
  /sbin
  /bin
  ~/.local/bin
  $path
)

# Force ASDF bins and shims to be before anything else in the path, otherwise,
# for whatever reason, Tmux won't prioritise the shims. This happened
# specifically for Python, where the `pip` binary was pointing at the ASDF shim,
# but `python` was pointing at `usr/bin`
ASDF_DIR="$HOME/.asdf"
export PATH="$ASDF_DIR/bin:$ASDF_DIR/shims:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# Disable Oh-My-Zsh updates: it will get done when the `update` function
# is run
export DISABLE_UPDATE_PROMPT=true
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
# FZF fuzzy finder default options for Solarized Dark
# https://github.com/junegunn/fzf/wiki/Color-schemes#alternate-solarized-lightdark-theme
# NOTE: Not sure if I want to keep this here or move it into a
# ~/.vim/settings/fzf.vim config file using `let g:fzf_colors`.
export FZF_DEFAULT_OPTS="
  --color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33
  --color info:136,prompt:136,pointer:230,marker:230,spinner:136
"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias ls="ls -FlAagG" # more detail with default `ls`
# NOTE: Use Exa (https://the.exa.website/) for ls
alias ls="exa --header --long --group-directories-first --git --all"
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
# NOTE: This doesn't seem to be needed anymore as Homebrew vim is now on
# version 8, and is bundled with Ruby and clipboard that also works in a tmux
# session, and Command-T can compile with system Ruby and work with this.
# If this changes and I need to go back to macvim, then `brew install macvim`.
# alias vim="mvim -v"
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
  if brew update && brew outdated && brew upgrade && brew cleanup; then
    echo "${green}Brew updates done.${reset}"
  else
    echo "${red}Brew updates failed.${reset}"
  fi

  echo "${yellow}Running Brew Cask updates...${reset}"
  # https://github.com/buo/homebrew-cask-upgrade#usage
  if brew cu --all --cleanup --yes && brew cleanup; then
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
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
  if asdf update && asdf plugin-update --all && asdf plugin list | xargs -I lang sh -c 'asdf install lang latest && asdf global lang $(asdf latest lang)'; then
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
  if gem update --system && gem update && gem cleanup; then
    echo "${green}Ruby gem updates done.${reset}"
  else
    echo "${red}Ruby gem updates failed.${reset}"
  fi

  echo "${yellow}Running Node package updates...${reset}"
  if npm install --global npm && npm update --global; then
    echo "${green}Node package updates done.${reset}"
  else
    echo "${red}Node package updates failed.${reset}"
  fi

  echo "${yellow}Running Python package updates...${reset}"
  # REF: https://stackoverflow.com/a/3452888/567863
  if pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install --upgrade; then
    echo "${green}Python package updates done.${reset}"
  else
    echo "${red}Python package updates failed.${reset}"
  fi

  echo "${yellow}Re-shimming ASDF binaries...${reset}"
  if rm -rf ~/.asdf/shims && asdf plugin-list | xargs -L 1 asdf reshim; then
    echo "${green}Re-shimming of ASDF binaries done.${reset}"
  else
    echo "${red}Re-shimming of ASDF binaries failed.${reset}"
  fi

  echo "${yellow}Running Vim plugin updates...${reset}"
  if vim +PlugUpdate +qall; then
    echo "${green}Vim plugin updates done.${reset}"
  else
    echo "${red}Vim plugin updates failed.${reset}"
  fi

  echo "${yellow}Running Oh My Zsh updates...${reset}"
  if omz update; then
    echo "${green}Oh My Zsh updates done.${reset}"
  else
    echo "${red}Oh My Zsh updates failed.${reset}"
  fi
}

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# Added for Crystal: https://github.com/crystal-lang/crystal/issues/6875#issuecomment-424999123
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig
# Added to hook in direnv: https://direnv.net/docs/hook.html#zsh
eval "$(direnv hook zsh)"
# Added for Quantum Mechanical Keyboard (QMK) firmware
export QMK_HOME=~/c/qmk_firmware

# Added for Google Cloud SDK. Instructions to add these lines suggested by
# running `brew cask info google-cloud-sdk`.
export CLOUDSDK_PYTHON="/usr/local/opt/python@3.8/libexec/bin/python"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
