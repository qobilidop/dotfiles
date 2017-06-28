#!/usr/bin/env sh

# Make sure brew is in PATH
which brew || PATH=~/.linuxbrew/bin:$PATH

brew tap homebrew/bundle
Brewfile=$1
brew bundle --file $Brewfile
