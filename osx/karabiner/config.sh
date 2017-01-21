#!/bin/bash
# Re-generate the Karabiner config file

# get current directory
KARABINER_DIR=$(dirname ${BASH_SOURCE:-$0})
SETUP_FILE=$KARABINER_DIR/setup.sh

echo "Generating Karabiner config..."
/Applications/Karabiner.app/Contents/Library/bin/karabiner export > $SETUP_FILE
chmod a+x $SETUP_FILE
echo "Complete!"
