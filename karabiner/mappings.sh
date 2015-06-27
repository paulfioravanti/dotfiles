#!/bin/bash
# Re-generate the Karabiner mappings file

# get current directory
KARABINER_DIR=$(dirname $BASH_SOURCE)

echo "Generating Karabiner settings..."
/Applications/Karabiner.app/Contents/Library/bin/karabiner export > $KARABINER_DIR/karabiner.sh
chmod a+x $KARABINER_DIR/karabiner.sh
echo "Complete!"
