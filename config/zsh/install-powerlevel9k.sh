#!/usr/bin/env bash

dir=~/.local/opt/oh-my-zsh/custom/themes/powerlevel9k
if [ ! -d $dir ]; then
    git clone https://github.com/bhilburn/powerlevel9k.git $dir
fi
