#!/bin/bash

# Install xcode terminal helper
xcode-select --install

# Install Homebrew, and run Brewfile
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install NVM and Node.js
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
source ~/.bashrc
nvm install node
nvm use node

# Install global Node tools
brew install yarn --without-node

yarn global add create-react-app
yarn global add create-react-native-app
yarn global add firebase-tools
yarn global add create-react-app
yarn global add @storybook/cli

echo "Setup Complete"
