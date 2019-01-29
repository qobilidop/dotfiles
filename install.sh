#!/usr/bin/env bash
#
# This script configures a macOS system to my liking from scratch
#

LOCAL="$HOME/local"

function git_sync() {
    # Clone and update a git repository
    local SRC="$1"
    local DST="$2"
    echo "Syncing $(basename "$DST")"
    if [[ ! -d "$DST" ]]; then
        mkdir -p "$(dirname "$DST")"
        git clone "$SRC" "$DST"
    else
        cd "$DST" && git pull && cd - >/dev/null
    fi
}

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

# Locate this directory
cd "$(dirname "$0")"

# Update repository
git pull
git submodule update --init --recursive

# Install Homebrew
command -v brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages through Homebrew
sudo -v
brew bundle -v --file=Brewfile
brew cleanup

# Python
pyenv install -s miniconda3-latest
pyenv global miniconda3-latest

# Ruby
ruby_latest="$(rbenv install -l | grep -v - | tail -1 | tr -d '[:space:]')"
rbenv install —s "$ruby_latest"
rbenv rehash
rbenv global "$ruby_latest"

# Set Zsh as default shell
ZSH="$(command -v zsh)"
if [[ "$SHELL" != "$ZSH" ]]; then
    sudo chsh -s "$ZSH" "$USER"
fi

# Install Oh My Zsh and Powerlevel9k theme
OHMYZ="$LOCAL/opt/oh-my-zsh"
git_sync https://github.com/robbyrussell/oh-my-zsh.git "$OHMYZ"
git_sync https://github.com/bhilburn/powerlevel9k.git "$OHMYZ/custom/themes/powerlevel9k"

# Configure global gitignore
GITIGNORE="$LOCAL/opt/gitignore"
git_sync https://github.com/github/gitignore.git "$GITIGNORE"
cat "$GITIGNORE"/Global/{macOS,VisualStudioCode}.gitignore > ~/.gitignore

# Deploy dotfiles to home directory
deploy private home
deploy home ~

# Configure macOS
# See https://github.com/mathiasbynens/dotfiles/blob/master/.macos
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock persistent-apps -array
