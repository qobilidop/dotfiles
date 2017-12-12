#!/usr/bin/env bash

# Determine which brew to install
if [[ $(uname) == 'Darwin' ]]; then
    # For Homebrew, it's recommended to just use the install script.
    # See https://brew.sh
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    # For Linuxbrew, let's use the alternative installation method.
    # See http://linuxbrew.sh/#alternative-installation
    dir=~/.local/opt/linuxbrew
    if [ ! -d $dir ]; then
        git clone https://github.com/Linuxbrew/brew.git $dir
    fi
    cd ~/.local/bin
    ln -fs ../opt/brew/bin/* .
fi
