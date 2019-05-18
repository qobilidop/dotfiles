#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"/..

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
deploy home ~

# Sync opt git repos
while read -r LINE; do
    read -ra WORDS <<< "$LINE"
    DIR="$HOME/.local/opt/${WORDS[0]}"
    REPO="${WORDS[1]}"
    echo "Checking $DIR ..."
    if [[ ! -d "$DIR" ]]; then
        # clone if not existing
        mkdir -p "$(dirname "$DIR")"
        git clone "$REPO" "$DIR"
    else
        # pull otherwise
        (
            cd "$DIR"
            git pull
        )
    fi
done < config/opt-git-repos
