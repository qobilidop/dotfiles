#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"/..

brew cask install visual-studio-code

# Install vscode extensions
EXTENSIONS="$(code --list-extensions)"
grep -v '^ *#' < data/vscode-extensions | while IFS= read -r EXTENSION; do
    if echo "$EXTENSIONS" | grep -q "$EXTENSION"; then
        echo "Extension '$EXTENSION' is already installed."
    else
        code --install-extension "$EXTENSION"
    fi
done
