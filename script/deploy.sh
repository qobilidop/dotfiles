#!/usr/bin/env bash

# Symlink dotfiles to home directory
function deploy() {
    # Deploy a directory of dotfiles to another location
    local SRC_DIR="$1"
    SRC_DIR="$(cd "$SRC_DIR" >/dev/null && pwd)"
    local DST_DIR="$2"
    shopt -s dotglob
    for SRC in "$SRC_DIR"/*; do
        DST="$DST_DIR/$(basename "$SRC")"
        if [[ -f "$SRC" || -L "$SRC" ]]; then
            rm -rf "$DST"
            mkdir -p "$DST_DIR"
            ln -s "$SRC" "$DST"
        elif [[ -d "$SRC" ]]; then
            deploy "$SRC" "$DST"
        fi
    done
    shopt -u dotglob
}

deploy "$1" "$2"
