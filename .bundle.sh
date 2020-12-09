#!/bin/bash

# Install Oh My Zsh
if ! [ $SHELL = '/bin/zsh' ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Homebrew
if ! [ -x "$(command -v brew)" ]; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew bundle

if [ -z "$(git status --porcelain)" ]; then 
  echo "You're all fresh!"
else 
  git status
  echo "You need to sync your home directory!"
fi