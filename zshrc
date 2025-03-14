# Path to your oh-my-zsh installation.
export ZSH=/Users/paul/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="paulfioravanti"

# Which plugins would you like to load?
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  brew
  bundler
  dotenv
  fancy-ctrl-z
  fasd
  git
  gitfast
  github
  macos
  tmux
  tmuxinator
  z
)

# User configuration

# zsh-specific config:
# https://superuser.com/questions/598810/zsh-config-to-export-or-not-to-export/598924#598924
typeset -U path
path=(
  /opt/homebrew/bin
  /usr/local/bin
  /usr/local/share/npm/bin
  /usr/local/sbin
  /usr/bin
  /usr/sbin
  /sbin
  /bin
  ~/.local/bin
  $PATH
)

export MANPATH="/usr/local/man:$MANPATH"

# REF: https://stackoverflow.com/questions/18371970/ruby-aliased-to-bundled-ruby
export UNBUNDLED_COMMANDS=(rubocop)

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
# REF: https://github.com/junegunn/fzf/issues/128#issuecomment-313638882
# REF: https://github.com/ggreer/the_silver_searcher/wiki/Advanced-Usage
# export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore --filename-pattern ""'
export FZF_CTRL_T_COMMAND='ag --path-to-ignore ~/.ignore --filename-pattern ""'

# Enable call outs to scripts in steno command dictionaries.
export STENO_DICTIONARIES="$HOME/steno/steno-dictionaries"

# pyqt5 install
# REF: https://stackoverflow.com/questions/74393139/pipenv-cant-install-pyqt5
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/opt/homebrew/opt/qt@5/bin:$PATH"

# Added for Quantum Mechanical Keyboard (QMK) firmware
export QMK_HOME="$HOME/c/qmk_firmware"
export SHELL=/bin/zsh

# REF: https://asdf-vm.com/guide/getting-started.html#_3-install-asdf
# . $(brew --prefix asdf)/libexec/asdf.sh
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias ls="ls -FlAagG" # more detail with default `ls`
# NOTE: Use Eza (https://eza.rocks/) for ls
alias ls="eza --header --long --group-directories-first --git --all"
# delete all local branches that have been merged into master, excluding current
# branch, develop, and master
alias gsweep='
    git branch --merged master
    | command grep -vE "^(\*|\s*develop\s*|\s*master\s*|\s*main\s*$)"
    | command xargs -n 1 git branch -d
'
# For whatever reason, the mux alias built into tmuxinator doesn't seem to
# be working, so just set it manually
alias mux=tmuxinator
# In order to do things like find . -name "*.ex" | map wc -l
alias map="xargs -n1"
# REF: https://plover.readthedocs.io/en/latest/cli_reference.html
alias plover=/Applications/Plover.app/Contents/MacOS/Plover

# Added to hook in direnv.
# REF: https://direnv.net/docs/hook.html#zsh
eval "$(direnv hook zsh)"
## Dotenv
# NOTE: oh-my-zsh dotenv doesn't seem to expand these in a way that Plover is
# able to read them from an interactive shell. So, expand them manually here.
set -o allexport
source "$HOME/.env"
set +o allexport

# REF: https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Functions

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
  failed=1
  asdf install elixir latest:1 && asdf set --home elixir latest:1 || failed=0
  asdf install elm latest:0 && asdf set --home elm latest:0 || failed=0
  asdf install erlang latest:27 && asdf set --home erlang latest:27 || failed=0
  asdf install nodejs latest:23 && asdf set --home nodejs latest:23 || failed=0
  asdf install python latest:3 && asdf set --home python latest:3 || failed=0
  asdf install redis latest:7 && asdf set --home redis latest:7 || failed=0
  asdf install ruby latest:3 && asdf set --home ruby latest:3 || failed=0
  if ((failed)); then
    echo "${red}Some ASDF updates failed.${reset}"
  else
    echo "${green}All ASDF updates succeeded.${reset}"
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
  # https://discuss.python.org/t/pip-22-3-list-list-format-freeze-can-not-be-used-with-the-outdated-option/20061/3
  if pip list --outdated --format=json | jq -r '.[] | "\(.name)==\(.latest_version)"' | xargs -n1 pip install --upgrade; then
    echo "${green}Python package updates done.${reset}"
  else
    echo "${red}Python package updates failed.${reset}"
  fi

  echo "${yellow}Re-shimming ASDF binaries...${reset}"
  if rm -rf ~/.asdf/shims && asdf plugin list | xargs -L 1 asdf reshim; then
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
