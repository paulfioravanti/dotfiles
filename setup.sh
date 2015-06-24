#!/bin/bash
# Set up a new Mac to get up and running for development.
# Assumes the following preconditions:
# 1. XCode has been installed from the App Store.  Its presence is needed
#    for some of the brew packages, and agreement to the license is required
#    to compile some Ruby versions.
# 2. $ git clone https://github.com/paulfioravanti/dotfiles.git ~/.dotfiles
#    has been run. On a new machine, using `git` may prompt you to install XCode
#    command line tools, which is expected behaviour and okay to do if you
#    haven't installed XCode already.

# Get current directory
DIR=$(dirname $BASH_SOURCE)

# Install brew packages and casks
source $DIR/brew/brewfile.sh

# Bootstrap rcup: the exclusions here are enumerated in the rcrc file so
# you should be able to just run $ rcup when doing this again
# Ignores the README, brew, and ruby directory for symlinking
rcup -x README.md setup.sh *:brew *:ruby

# Apply new terminal settings
source ~/.bash_profile

# Install Vundle to get vim plugins defined in .vimrc up and running
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Get Solarized colors for iTerm. Follow up with installation manually.
git clone https://github.com/altercation/solarized.git ~/solarized

# Install Ruby versions
source $DIR/ruby/chruby.sh

# TODO: Attempt to automate as much as the tasks below as possible
#
# Manual App-related follow-up tasks:
# 1. Install Solarized colours into iTerm2 default profile
#    $ cd ~/solarized/iterm2-colors-solarized
#    $ open .
#    - Double click Solarized Dark.itermcolors and Solarized Light.itermcolors
#    to install them into iTerm2
#    - Delete the ~/solarized directory
# 2. Set up Dropbox app to get 1Password vault and Mavis Beacon app
# 3. Set up 1Password
#    - Use vault from Dropbox
#    - Install extension for Chrome, Firefox, and Safari
# 4. Set up Google Drive
# 5. Install the following programs:
#    From the App Store:
#    - XCode (should be installed already)
#    - Numbers
#    - Pages
#    - iMovie
#    - Garageband
#    - Kindle
#    - Twitter
#    - PDF Squeezer
#    - Monosnap
#    - Form
#    Other:
#    - Mavis Beacon
# 6. Organise the OSX dock to have the following apps in it:
#    - Finder
#    - Launchpad
#    - Chrome
#    - Keynote
#    - Photos
#    - App Store
#    - iMessages
#    - Skype
#    - Twitter
#    - Flowdock
#    - Slack
#    - 1Password
#    - iTerm2
#    - Mavis Beacon
#    - System Preferences
#    - Activity Monitor
# 6. Configure Karabiner to change Caps Lock to Ctrl/Esc
#    - Open Karabiner and allow it access to accessibility settings
#    - In the key remappings, under the Change Control_L_Key (Left Control)
#      settings, check:
#      - Control_L to Control_L (+ When you type Control_L only, send Escape)
################################################################################
#
# Manual Mac system settings follow-up tasks:
# 1. Organise the Finder favourites bar:
#    - Create a Homebrew Apps Saved Search
#      a. In the Finder, go to /opt/homebrew-cask/Caskroom
#      b. Type something in the search field and delete it in order to bring
#         up Saved search settings
#      c. Create a saved search with the following conditions:
#        - Kind is Application
#        - Name is not Little Snitch Installer
#        - Name is not Little Snitch Uninstaller
#        - Name is not ControllerMate Uninstaller
#        - Name is not Logitech Control Center Installer
#        - Name is not Skala Color Installer
#        - Name is not Uninstall
#        - Name is not Uninstall Fitbit Connect
#    - Organise the favourites bar in the following order:
#      - Macintosh HD
#      - <home>
#      - Applications
#      - Homebrew Apps
#      - Desktop
#      - Downloads
#      - Documents
#      - Pictures
#      - Music
#      - Movies
#      - Dropbox (Personal)
#      - Google Drive
#      - Airdrop
# 2. Under System Preferences > Keyboard > Modifier Keys:
#    - On the Caps Lock dropdown, select  "^ Control"
#      (This is preparation for the Karabiner step below)
