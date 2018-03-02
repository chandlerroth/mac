#!/bin/bash

# Install xcode terminal helper
xcode-select --install

# Install Homebrew, and run Brewfile
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install global Node tools
brew install yarn --without-node

yarn global add create-react-app
yarn global add create-react-native-app
yarn global add firebase-tools
yarn global add create-react-app
yarn global add @storybook/cli

apm install atom-beautify
apm install teletype
apm install file-icons
apm install highlight-selected

echo "Setup Complete"
