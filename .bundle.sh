#!/bin/bash

printf "Checking for Mac update...\n"
git fetch

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

printf "\n"
printf "Updating Homebrew...\n"
brew update

printf "\n"
printf "Installing Homebrew apps...\n"
brew bundle

if [ -f "~/Projects" ]; then
    printf "\n"
    echo "Setting up Projects directory...\n"
    mkdir Projects
fi

if ! [ -z "$(git status --porcelain)" ]; then 
  printf "\n"
  git status
  printf "\n"
  echo "Warning: You need to sync your home directory!"
fi