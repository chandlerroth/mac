#!/bin/bash

shopt -s dotglob nullglob
mv mac/* ~
rm -rf mac
~/.bundle.sh

defaults write com.apple.dock autohide-delay -float 1000; killall Dock
