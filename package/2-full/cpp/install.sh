#!/usr/bin/env bash

mas install 497799835 # Xcode
sudo xcodebuild -license accept

brew install cmake llvm
ln -s "$(brew --prefix llvm)/bin/clang-format" "/usr/local/bin/clang-format"
ln -s "$(brew --prefix llvm)/bin/clang-tidy" "/usr/local/bin/clang-tidy"
