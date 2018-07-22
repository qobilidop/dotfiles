#!/usr/bin/env bash

dir=~/.local/opt/oh-my-zsh
if [ ! -d $dir ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $dir
fi
