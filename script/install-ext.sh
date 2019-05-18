#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"/..

# Install ext packages
brew bundle -v --file=config/Brewfile-ext

# Install conda env lab
conda env update -f config/conda-env-lab.yml

# Install vscode extensions
EXTENSIONS="$(code --list-extensions)"
grep -v '^ *#' < config/vscode-extensions | while IFS= read -r EXTENSION; do
    if echo "$EXTENSIONS" | grep -q "$EXTENSION"; then
        echo "Extension '$EXTENSION' is already installed."
    else
        code --install-extension "$EXTENSION"
    fi
done
