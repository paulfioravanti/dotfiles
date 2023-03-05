#!/bin/bash
# Set up a new Mac to get up and running for development.
# See the README.md file for install preconditions before running this script.

# Get current directory
DOTFILES_DIR=$(dirname "${BASH_SOURCE:-$0}")

# Install brew packages and casks
source "${DOTFILES_DIR}/macos/homebrew/setup.sh"

# Bootstrap rcup: the exclusions here are enumerated in the rcrc file so
# you should be able to just run `$ rcup` when doing this again
# Ignores the README, setup scripts, and the ruby and macos directories
# for symlinking
rcup -x README.md -x LICENSE.txt -x setup.sh -x config.sh -x '*:vim:setup.sh' -x '*:tmux:setup.sh' -x '*:oh-my-zsh:setup.sh' -x macos -x asdf -x 'Library/Services'

# Install and setup oh-my-zsh
source "${DOTFILES_DIR}/oh-my-zsh/setup.sh"

# Setup asdf
source "${DOTFILES_DIR}/asdf/setup.sh"

# Setup tmux
source "${DOTFILES_DIR}/tmux/setup.sh"

# Setup iterm2
source "${DOTFILES_DIR}/macos/iterm2/setup.sh"

# REF: https://stackoverflow.com/a/59637792/567863
__dock_item() {
  printf '%s%s%s%s%s' \
         '<dict><key>tile-data</key><dict><key>file-data</key><dict>' \
         '<key>_CFURLString</key><string>' \
         "$1" \
         '</string><key>_CFURLStringType</key><integer>0</integer>' \
         '</dict></dict></dict>'
}

defaults write com.apple.dock persistent-apps -array \
  "$(__dock_item /System/Applications/Photos.app)" \
  "$(__dock_item /Applications/Slack.app)" \
  "$(__dock_item /Applications/Discord.app)" \
  "$(__dock_item /Applications/Google\ Chrome.app)" \
  "$(__dock_item /Applications/Trello.app)" \
  "$(__dock_item /System/Applications/App\ Store.app)" \
  "$(__dock_item /Applications/iTerm.app)" \
  "$(__dock_item /System/Applications/System\ Preferences.app)" \
  "$(__dock_item /System/Applications/Utilities/Activity\ Monitor.app)" \

echo "Finished initial setup!"
echo "You should probably restart the computer now."

# TODO: Attempt to automate as much as the tasks below as possible
#
# Manual App-related follow-up tasks:
# - Set up Dropbox app to get 1Password vault
# - Set up 1Password
#    - Use vault from Dropbox
#    - Install 1Password extension for Chrome, Firefox, and Safari
# - Set up Google Drive
# - Install the following extensions for Firefox:
#    - Rikaichan (plus dictionaries)
#
################################################################################
################################################################################
#
# Manual Mac system settings follow-up tasks:
# - Add new public key to Github and any other accounts that need it:
#   - $ pbcopy < ~/.ssh/id_ed25519.pub
# - Organise the Finder favourites bar in the following order:
#   - Macintosh HD
#   - <home>
#   - Applications
#   - Desktop
#   - Downloads
#   - Documents
#   - Pictures
#   - Music
#   - Movies
#   - Dropbox (Personal)
#   - Google Drive
#   - Airdrop
# - Organise the macOS dock to have the following apps in it (and set them up
#    appropriately):
#    - Finder
#    - Chrome
#    - Photos
#    - App Store
#    - iMessages
#    - Slack
#    - Discord
#    - iTerm2
#    - System Preferences
#    - Activity Monitor
#    - 1Password
#    - Trello
#    - Twitter
#    - Plover
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
#         Spotlight shortcuts to: ^CmdSpace and ^OptionCmdSpace
#     - Under Input Sources Tab:
#       - Add Alphanumeric (Google)
#       - Add U.S.
#       - Add Hiragana (Google)
#       - Remove Australian
#    - Under Battery:
#      - Under Battery Tab, set turn off display after 15 mins
#      - Under Power Adapter Tab, set turn off display after 3 hours
#    - Under Trackpad:
#      - Set Tracking Speed to max
#      - Uncheck Scroll direction: natural
#    - Under User & Groups > Login Items, set the following list:
#      - Dropbox, Alfred 4, Divvy, Karabiner, Google Drive
#    - Under Software Update:
#      - Under Advaced Tab: Uncheck Install App updates and Install macOS updates
#    - Under Date & Time
#      - Check Show Date and Time in menu bar, show the day of the week,
#        and show date (seems like this happens by default now...)
#    - Under Time Machine
#      - Check Show Time Machine in Menu Bar
