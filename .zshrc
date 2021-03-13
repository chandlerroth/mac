eval "$(/opt/homebrew/bin/brew shellenv)"

export ZSH="/Users/$(whoami)/.oh-my-zsh"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

eval "$(nodenv init -)"
eval "$(pyenv init -)"
eval "$(rbenv init -)"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias mac=~/.bundle.sh
alias dc="docker-compose"
