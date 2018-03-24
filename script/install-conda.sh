#!/usr/bin/env bash

function install()
{
    OS=$1
    # https://conda.io/miniconda.html
    curl https://repo.continuum.io/miniconda/Miniconda3-latest-$OS-x86_64.sh -o miniconda.sh
    bash miniconda.sh -b -p $HOME/.local/opt/conda
    rm miniconda.sh
}

case $(uname) in
    "Darwin")
        install "MacOSX"
        ;;
    "Linux")
        install "Linux"
        ;;
    *)
        echo "Unknown OS"
        ;;
esac
