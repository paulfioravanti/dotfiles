#!/bin/bash

# Install the following programs from the App Store:
# Numbers
# Pages
# Kindle
# Twitter
# PDF Squeezer

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
  avr-libc
  brew-cask
  cmatrix
  ctags
  elixir
  emacs
  erlang
  fontconfig
  gcc48
  gettext
  ghostscript
  git
  git-flow
  hub
  imagemagick
  keybase
  libksba
  libxml2
  libyaml
  macvim
  mercurial
  ossp-uuid
  phantomjs
  postgresql
  rcm
  redis
  the_silver_searcher
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
  calibre
  chicken
  colloquy
  controllermate
  cyberduck
  dash
  divvy
  dropbox
  duplicate-annihilator
  filezilla
  firefox
  fitbit-connect
  flip4mac
  flowdock
  google-chrome
  google-drive
  google-japanese-ime
  gpgtools
  growlnotify
  handbrake
  iterm2
  karabiner
  little-snitch
  omnigraffle
  pgadmin3
  picasa
  remote-buddy
  screenflow
  silverlight
  simple-comic
  skitch
  skype
  slack
  smcfancontrol
  sqlitebrowser
  steam
  sublime-text
  teensy
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
