export ZSH="/Users/chandlerroth/.oh-my-zsh"
export PATH="$PATH:/Users/chandlerroth/.dotnet/tools"
export PATH=~/Library/Android/sdk/tools:$PATH
export PATH=~/Library/Android/sdk/platform-tools:$PATH

eval "$(nodenv init -)"
eval "$(pyenv init -)"
eval "$(rbenv init -)"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias mac=~/.bundle.sh
alias "mac-install"="code ~/Brewfile"
alias dc="docker-compose"