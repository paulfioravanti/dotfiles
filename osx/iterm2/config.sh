#!/bin/bash
# Re-generate the iterm2 config file

# get current directory
ITERM_DIR=$(dirname ${BASH_SOURCE:-$0})

echo "Generating iterm2 config..."
cp ~/Library/Preferences/com.googlecode.iterm2.plist $ITERM_DIR/.
echo "Complete!"
