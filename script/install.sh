#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"/..

command -v brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle -v --file=config/Brewfile
