#!/usr/bin/env bash

# Parse arguments
CONFIG_DIR="$1"

# Install Homebrew
command -v brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Process each group
for GROUP_DIR in "$CONFIG_DIR"/*; do
    GROUP_NAME="$(basename $GROUP_DIR)"
    echo "$GROUP_NAME"

    ./"$GROUP_DIR/install.sh"
done
