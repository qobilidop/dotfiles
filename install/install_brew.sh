#!/usr/bin/env bash
# Install brew on macOS (Homebrew) or Linux (Linuxbrew).

function install_ruby()
{
    # Download and install ruby in ~/.local
    curl -o ~/ruby.tar.gz https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.gz
    cd ~ && tar -zxvf ruby.tar.gz
    cd ruby-2.4.1
    ./configure --prefix=$HOME/.local
    make
    make install
    cd ~ && rm -rf ruby-2.4.1 && rm ruby.tar.gz
    export PATH=$HOME/.local/bin:$PATH
}

function install_homebrew()
{
    # See https://brew.sh/
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function install_linuxbrew()
{
    # See http://linuxbrew.sh/
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
}

which ruby || install_ruby
case $(uname) in
    "Darwin")
        install_homebrew
        ;;
    "Linux")
        install_linuxbrew
        ;;
    *)
        echo "Unknown OS"
        ;;
esac
