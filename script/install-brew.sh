#!/usr/bin/env bash

# Determine which brew to install
if [[ $(uname) == 'Darwin' ]]; then
    # https://brew.sh
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    # http://linuxbrew.sh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
fi
