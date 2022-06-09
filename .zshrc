if [[ -s "$HOME/.env" ]]; then
    export $(echo -e $(cat $HOME/.env))
fi

if [[ $(arch) = "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export ZSH_DISABLE_COMPFIX=true
export ZSH="/Users/$(whoami)/.oh-my-zsh"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
ZSH_THEME="robbyrussell"
plugins=(git web-search)
source $ZSH/oh-my-zsh.sh

eval "$(nodenv init -)"
eval "$(rbenv init -)"
eval "$(goenv init -)"
eval "$(pyenv init -)"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias mac=~/.bundle.sh
alias dc="docker-compose"
alias myip="curl -s https://ipecho.net/plain"
