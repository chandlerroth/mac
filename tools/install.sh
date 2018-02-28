#!/bin/bash

xcode-select --install

# dotfiles
ln -s ~/Dropbox/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/Dropbox/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Dropbox/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Dropbox/dotfiles/.vimrc ~/.vimrc

# brew stuff
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
cd ~/Dropbox/dotfiles
brew bundle
cd ~

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# ruby
rbenv install 2.2.5
rbenv global 2.2.5

gem install bundler

echo "******************** Done ********************"
echo "Don't forget to configure SSH properly with key and config"
