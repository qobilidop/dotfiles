#!/usr/bin/env bash

function install_rvm()
{
    # See https://rvm.io/rvm/install
    # Always prefer rvm ruby to system ruby.
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    \curl -sSL https://get.rvm.io | bash -s stable --ruby --ignore-dotfiles
    source ~/.rvm/scripts/rvm
}

function install_brew()
{
    # See https://github.com/Linuxbrew/install/blob/master/install
    # This script automatically determines platform and installs Homebrew or Linuxbrew accordingly.
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
}

which rvm || install_rvm
which brew || install_brew
