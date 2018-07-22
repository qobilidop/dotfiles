#!/usr/bin/env bash

# Determine which brew to install
if [[ $(uname) == 'Darwin' ]]; then
    # https://brew.sh
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    # http://linuxbrew.sh/#alternative-installation
    dir=~/.linuxbrew
    if [ ! -d $dir ]; then
        git clone https://github.com/Linuxbrew/brew.git $dir
    fi
fi
