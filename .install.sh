#!/bin/bash

shopt -s dotglob nullglob
mv mac/* ~
rm -rf mac
~/.bundle.sh