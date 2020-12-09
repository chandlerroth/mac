export ZSH="/Users/$(whoami)/.oh-my-zsh"
export PATH="$PATH:/Users/$(whoami)/.dotnet/tools"
export PATH=~/Library/Android/sdk/tools:$PATH
export PATH=~/Library/Android/sdk/platform-tools:$PATH

eval "$(nodenv init -)"
eval "$(pyenv init -)"
eval "$(rbenv init -)"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias mac=~/.bundle.sh
alias dc="docker-compose"
