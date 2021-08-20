#!/bin/bash
# Configure tmux and install plugins

# Install tpm to get tmux plugins defined in .tmux.conf up and running
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# shellcheck disable=SC1090
source ~/.tmux/plugins/tpm/bin/install_plugins
