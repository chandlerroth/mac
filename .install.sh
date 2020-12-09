#!/bin/bash

git clone git@github.com:chandlerroth/mac.git
shopt -s dotglob nullglob
mv mac/* ~
rm -rf mac
~/.bundle.sh