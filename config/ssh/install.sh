#!/usr/bin/env bash

if [[ -f ~/.ssh/id_rsa ]]; then
    cp ~/Documents/crypto.zip ~/.ssh
    (
        cd ~/.ssh
        unzip crypto.zip
    )
    rm ~/.ssh/crypto.zip
fi
