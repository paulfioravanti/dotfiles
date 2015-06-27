#!/bin/bash
# Set up a new Mac to get up and running for development.
# Assumes the following preconditions:
# - FileVault has been turned on
# - XCode has been installed from the App Store.  Its presence is needed
#    for some of the brew packages, and agreement to the license is required
#    to compile some Ruby versions.
# - $ git clone https://github.com/paulfioravanti/dotfiles.git ~/.dotfiles
#    has been run. On a new machine, using `git` may prompt you to install XCode
#    command line tools, which is expected behaviour and okay to do if you
#    haven't installed XCode already.

# Get current directory
DOTFILES_DIR=$(dirname $BASH_SOURCE)

# Install brew packages and casks
source $DOTFILES_DIR/brew/brewfile.sh

# Bootstrap rcup: the exclusions here are enumerated in the rcrc file so
# you should be able to just run $ rcup when doing this again
# Ignores the README, setup script, brew, and ruby directory for symlinking
rcup -x README.md -x setup.sh -x *:brew -x *:ruby

# Get Solarized colors for iTerm. Follow up with installation manually.
git clone https://github.com/altercation/solarized.git ~/solarized
open ~/solarized/iterm2-colors-solarized/Solarized\ Dark.itermcolors
open ~/solarized/iterm2-colors-solarized/Solarized\ Light.itermcolors
rm -rf ~/solarized

# Install Vundle to get vim plugins defined in .vimrc up and running
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install Ruby versions
source $DOTFILES_DIR/ruby/chruby.sh

# Change the remote url to use the ssh version
cd ~/.dotfiles
git remote set-url origin git@github.com:paulfioravanti/dotfiles.git

echo "Finished initial setup!"

# TODO: Attempt to automate as much as the tasks below as possible
#
# Manual App-related follow-up tasks:
# - Set up Dropbox app to get 1Password vault and Mavis Beacon app
# - Set up 1Password
#    - Use vault from Dropbox
#    - Install extension for Chrome, Firefox, and Safari
# - Set up Google Drive
# - Install the following programs:
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
# - Install the following extensions for Google Chrome (synced via Chrome?):
#    - AdBlock
#    - Google Mail Checker
#    - Reddit Enhancement Suite
#    - rikaikun
#    - Vimium
# - Install the following extensions for Firefox:
#    - Rikaichan (plus dictionaries)
# - Configure Karabiner to change Caps Lock to Ctrl/Esc
#    - Open Karabiner and allow it access to accessibility settings
#    - In the key remappings, under the Change Control_L_Key (Left Control)
#      settings, check:
#      - Control_L to Control_L (+ When you type Control_L only, send Escape)
#    - In the key remappings, under the Change Return Key settings, check:
#      - Return to Control_L (+ When you type Return only, send Return)
#
################################################################################
################################################################################
#
# Manual Mac system settings follow-up tasks:
# - Organise the Finder favourites bar:
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
