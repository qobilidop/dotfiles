#!/usr/bin/env bash

# Set Zsh as default shell
ZSH_BIN="$(command -v zsh)"
if [[ "$SHELL" != "$ZSH_BIN" ]]; then
    sudo chsh -s "$ZSH_BIN" "$USER"
fi
unset ZSH_BIN

# Retrieve crypto key from 1Password
if [[ ! -f ~/.ssh/id_rsa ]]; then
    eval "$(op signin qobilidop.1password.com qobilidop@gmail.com)"
    op get document id_rsa > ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa
fi

# Set macOS defaults
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock persistent-apps -array
