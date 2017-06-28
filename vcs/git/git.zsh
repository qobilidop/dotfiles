#!/usr/bin/env zsh

if [[ -d ~/.gitignore ]]; then
    cat ~/.gitignore/* > ~/.gitignore_global
fi
