#!/bin/bash

# Install Oh My Zsh
if ! [ $SHELL = '/bin/zsh' ]; then
    printf "Installing Oh My Zsh...\n"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Homebrew
if ! [ -x "$(command -v brew)" ]; then
    printf "Installing Homebrew...\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

printf "Updating Homebrew...\n"
brew update

printf "\n"
printf "Installing Homebrew apps...\n"
brew bundle

if ! [ -z "$(git status --porcelain)" ]; then 
  printf "\n"
  git status
  printf "\n"
  echo "Warning: You need to sync your home directory!"
fi