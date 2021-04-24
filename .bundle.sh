#!/bin/bash

(cd ~; git fetch)

# "Edit" command
if [[ $1 = 'e' ]] || [[ $1 = 'edit' ]]; then
    echo "Opening ~/.Brewfile ..."
    if [ -x "$(command -v code)" ]; then
        code ~/.Brewfile
    else
        vi ~/.Brewfile
    fi
    exit 0
fi

printf "Checking for Mac update...\n"
softwareupdate -l

# Install Oh My Zsh
if ! [[ $SHELL = '/bin/zsh' ]]; then
    printf "Installing Oh My Zsh...\n"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Homebrew
if ! [[ -x "$(command -v brew)" ]]; then
    printf "Installing Homebrew...\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

printf "\n"
printf "Updating Homebrew...\n"
brew update

printf "\n"
printf "Installing Homebrew apps...\n"
brew bundle --cleanup --global

if [[ $1 = 'u' ]] || [[ $1 = 'upgrade' ]]; then
    printf "\n"
    printf "Upgrading Homebrew apps...\n"
    brew upgrade
fi

if [[ -f "~/Projects" ]]; then
    printf "\n"
    echo "Setting up Projects directory...\n"
    mkdir ~/Projects
fi

if ! [[ -z "$(cd ~; git status --porcelain)" ]]; then 
  printf "\n"
  (cd ~; git status)
  printf "\n"
  echo "Warning: You need to sync your home directory!"
fi