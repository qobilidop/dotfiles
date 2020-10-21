#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

command -v code || brew cask install visual-studio-code

# Install vscode extensions
code --install-extension eamodio.gitlens
code --install-extension mrcrowl.hg
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension njpwerner.autodocstring
code --install-extension redhat.vscode-yaml
code --install-extension shardulm94.trailing-spaces
code --install-extension timonwong.shellcheck
