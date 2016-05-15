#!/bin/bash
# Set up a new Mac to get up and running for development.
# See the README.md file for install preconditions before running this script.

# Get current directory
DOTFILES_DIR=$(dirname ${BASH_SOURCE:-$0})

# Generate ssh key
ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa

# Install brew packages and casks
source $DOTFILES_DIR/osx/brew/brew.sh

# Get Solarized colors for iTerm.
git clone https://github.com/altercation/solarized.git ~/solarized
open ~/solarized/iterm2-colors-solarized/Solarized\ Dark.itermcolors
open ~/solarized/iterm2-colors-solarized/Solarized\ Light.itermcolors

# Bootstrap rcup: the exclusions here are enumerated in the rcrc file so
# you should be able to just run `$ rcup` when doing this again
# Ignores the README, setup scripts, and the ruby and osx directories
# for symlinking
rcup -x README.md -x setup.sh -x config.sh -x *:vim:vim.sh -x *:tmux:tmux.sh -x *:oh-my-zsh:oh-my-zsh.sh -x ruby -x osx

# Configure vim
source $DOTFILES_DIR/vim/vim.sh

# Configure tmux
source $DOTFILES_DIR/tmux/tmux.sh

# Configure Karabiner
source $DOTFILES_DIR/osx/karabiner/karabiner.sh

# Configure iterm2
source $DOTFILES_DIR/osx/iterm2/iterm2.sh

# Install Ruby versions
source $DOTFILES_DIR/ruby/chruby.sh

# Install oh-my-zsh
source $DOTFILES_DIR/oh-my-zsh/oh-my-zsh.sh

# Change the remote url to use the ssh version
cd ~/.dotfiles
git remote set-url origin git@github.com:paulfioravanti/dotfiles.git

# Clean up
rm -rf ~/solarized

echo "Finished initial setup!"
echo "You should probably restart the computer now."

# TODO: Attempt to automate as much as the tasks below as possible
#
# Manual App-related follow-up tasks:
# - Set up Dropbox app to get 1Password vault and Mavis Beacon app
# - Set up 1Password
#    - Use vault from Dropbox
#    - Install 1Password extension for Chrome, Firefox, and Safari
# - Set up Google Drive
# - Install the following programs:
#    From the App Store:
#    - Numbers
#    - Pages
#    - Kindle
#    - Twitter
#    - PDF Squeezer
#    - Monosnap
#    - Form
#    - Deckset
#    Other:
#    - Mavis Beacon (also install update and import user data)
# - Install the following extensions for Firefox:
#    - Rikaichan (plus dictionaries)
#
################################################################################
################################################################################
#
# Manual Mac system settings follow-up tasks:
# - Add new public key to Github and any other accounts that need it:
#   - $ pbcopy < ~/.ssh/id_rsa.pub
# - Organise the Finder favourites bar in the following order:
#   - Macintosh HD
#   - <home>
#   - Applications
#   - Homebrew Apps (in ~/Library/Saved Searches/Homebrew Apps.savedSearch)
#   - Desktop
#   - Downloads
#   - Documents
#   - Pictures
#   - Music
#   - Movies
#   - Dropbox (Personal)
#   - Google Drive
#   - Airdrop
# - Organise the OSX dock to have the following apps in it (and set them up
#    appropriately):
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
# - Under System Preferences
#   - Under Keyboard > Modifier Keys:
#     - On the Caps Lock dropdown, select  "^ Control"
#       (This is preparation for the Karabiner step below)
#   - Under Desktop & Screen Saver:
#     - Create hot corner for Screen saver at top right corner
#   - Under Dock:
#     - Check Automatically hide and show the Dock
#   - Under Language and Region:
#     - Add Japanese
#     - Under English, check use 24-hour clock
#   - Under Keyboard:
#     - Under Keyboard Tab:
#       - Max out Key Repeat
#       - Check Show Keyboard & Character Viewers in menu bar
#     - Under Shortcuts Tab:
#       - For Input Sources, check both shortcuts
#       - The above will conflict with Spotlight shortcuts, so change the
#         Spotlight shortcuts to: ^CmdSpace and ^OptionSpace
#     - Under Input Sources Tab:
#       - Add Alphanumeric (Google)
#       - Add U.S.
#       - Add Hiragana (Google)
#       - Remove Australian
#    - Under Energy Saver:
#      - Under Battery Tab, set turn off display after 15 mins
#      - Under Power Adapter Tab, set turn off display after 3 hours
#    - Under Trackpad:
#      - Set Tracking Speed to max
#      - Uncheck Scroll direction: natural
#    - Under User & Groups > Login Items, set the following list:
#      - Dropbox, Alfred 2, Divvy, Karabiner, Flux, Google Drive
#    - Under App Store:
#      - Uncheck Install App updates and Install OSX updates
#    - Under Date & Time
#      - Check Show Date and Time in menu bar, show the day of the week,
#        and show date
#    - Under Time Machine
#      - Check Show Time Machine in Menu Bar
