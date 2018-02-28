#!/bin/bash

# Install xcode terminal helper
xcode-select --install

# Install Homebrew, and run Brewfile
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle

echo "Setup Complete"
