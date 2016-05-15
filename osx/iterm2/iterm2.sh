#!/bin/bash
# Copy over iterm2 settings

# get current directory
ITERM_DIR=$(dirname ${BASH_SOURCE:-$0})

echo "Copying iterm2 config..."
cp $ITERM_DIR/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
echo "Complete!"
