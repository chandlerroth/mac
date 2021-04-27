if [[ -s ".env" ]]; then
    export $(echo -e $(cat .env))
fi

if [[ $(arch) = "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export ZSH_DISABLE_COMPFIX=true
export ZSH="/Users/$(whoami)/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git web-search)
source $ZSH/oh-my-zsh.sh

eval "$(nodenv init -)"
eval "$(pyenv init -)"
eval "$(rbenv init -)"
eval "$(goenv init -)"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias gms=~/.bundle.sh
alias dc="docker-compose"
