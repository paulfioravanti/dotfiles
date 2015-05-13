#!/bin/bash

# Install the following programs from the App Store:
# XCode
# Numbers
# Pages
# iMovie
# Garageband
# Kindle
# Twitter
# PDF Squeezer
# Monosnap
# Form

# Install Brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

taps=(
  homebrew/dupes
  homebrew/versions
  raggi/ale
  thoughtbot/formulae
  larsimmisch/homebrew-avr
)

for tap in ${taps[@]}; do
  brew tap $tap
done

# $ brew leaves | pbcopy
# Paste in using Vim: "+p
# Leave Rust programming language out until there is adequate support
# for both rust and cargo in brew
packages=(
  alpine
  avr-libc
  brew-cask
  chicken
  cmatrix
  ctags
  curl
  dash
  elixir
  emacs
  erlang
  fontconfig
  gcc48
  gcc49
  ghostscript
  git
  git-flow
  heroku-toolbelt
  hub
  imagemagick
  irssi
  keybase
  libksba
  libxml2
  libyaml
  macvim
  mercurial
  mysql
  nmap
  openssl098
  ossp-uuid
  phantomjs
  postgresql
  rcm
  redis
  s3cmd
  screen
  sphinx
  sqlitebrowser
  the_silver_searcher
  tmate
  tmux
  tree
  wget
)

for package in ${packages[@]}; do
  brew install $package
done

# $ brew cask list | pbcopy
# Paste in using Vim: "+p
casks=(
  1password
  alfred
  audacity
  balsamiq-mockups
  bettertouchtool
  brackets
  calibre
  chicken
  colloquy
  colorpicker-skalacolor
  controllermate
  cyberduck
  dash
  data-rescue
  divvy
  dropbox
  duplicate-annihilator
  expandrive
  filezilla
  firefox
  fitbit-connect
  flowdock
  flux
  google-chrome
  google-drive
  google-japanese-ime
  gpgtools
  growlnotify
  handbrake
  hipchat
  iterm2
  karabiner
  little-snitch
  logitech-control-center
  omnigraffle
  pgadmin3
  picasa
  recordit
  remote-buddy
  screenflow
  silverlight
  skitch
  skype
  slack
  smcfancontrol
  sonic-pi
  sqlitebrowser
  steam
  sublime-text
  techstoreclub-simple-comic
  teensy
  things
  torbrowser
  typed
  unrarx
  vlc
  vox
  wjoy
  zipeg
)

for cask in ${casks[@]}; do
  brew cask install $cask
done

brew cask cleanup
brew cleanup
