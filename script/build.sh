#!/usr/bin/env bash

# Parse arguments
CONFIG_DIR="$1"
BUILD_DIR="$2"

# Prepare directories
mkdir -p "$BUILD_DIR/.zshrc.d"

# Process each group
for GROUP_DIR in "$CONFIG_DIR"/*; do
    if [[ ! -d "$GROUP_DIR" ]]; then
        break
    fi

    GROUP_NAME="$(basename $GROUP_DIR)"
    echo "$GROUP_NAME"

    LINK_SRC="$GROUP_DIR/link"
    if [[ -d "$LINK_SRC" ]]; then
        cp -r "$GROUP_DIR/link/" build/
    fi

    SETUP_SRC="$GROUP_DIR/setup.zsh"
    if [[ -f "$SETUP_SRC" ]]; then
        cp "$GROUP_DIR/setup.zsh" "build/.zshrc.d/$GROUP_NAME.zsh"
    fi
done
