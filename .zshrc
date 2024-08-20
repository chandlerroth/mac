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

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

if [ -f '/Users/chandler/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/chandler/Downloads/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/chandler/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/chandler/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export ZEET_HOME="$HOME/Projects/zeet"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/Users/chandler/.dotnet/tools"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# sst
export PATH=/Users/chandlerroth/.sst/bin:$PATH
if [ -f "/Users/chandlerroth/.config/fabric/fabric-bootstrap.inc" ]; then . "/Users/chandlerroth/.config/fabric/fabric-bootstrap.inc"; fi

alias mac="~/.bundle.sh"
alias dc="docker compose"
alias myip="curl -s ipinfo.io/json | jq -r '.[\"ip\"]'"
alias prlog="git --no-pager log $(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')..$(git branch --show-current) --reverse --oneline --no-decorate"
alias gitpf="~/.git-force-pull.sh"

function ytd() {
    local youtube_id=$(echo "$1" | sed -E 's#(https?://)?(www\.)?youtube\.com/watch\?v=##; s#(https?://)?(www\.)?youtu\.be/##; s#(https?://)?(www\.)?youtube\.com/shorts/##; s/&.*//; s/\?.*//;')
    
    yt-dlp "$1" -f mp4 -o "/Users/chandlerroth/Documents/Data/Videos/$youtube_id".mp4;
}


function silent() {
    $1 > /dev/null 2>&1;
};

## AI commands
function gaw() {
    go-readability "$1" | html2md -i | tee "/Users/chandlerroth/Documents/Data/Articles/${1##*/}".md | extract_article_wisdom --stream | tee "/Users/chandlerroth/Documents/Data/Articles/${1##*/}"-wisdom.md;
}

function spk() {
    if [[ "$1" == *.mp3 ]] && [ -f "$1" ]; then
        mpv "$1"
        elif [ -f "$1.mp3" ]; then
        mpv "$1.mp3"
    else
        edge-tts -v en-US-AvaNeural --rate=+25% --file="$1" --write-media="$1.mp3" && mpv $1.mp3
    fi
}

function ytw() {
    local youtube_id=$(echo "$1" | sed -E 's#(https?://)?(www\.)?youtube\.com/watch\?v=##; s#(https?://)?(www\.)?youtu\.be/##; s#(https?://)?(www\.)?youtube\.com/shorts/##; s/&.*//; s/\?.*//;')
    
    ytd "$1" && yt --transcript "$1" | tee "/Users/chandlerroth/Documents/Data/Videos/$youtube_id".txt | extract_wisdom --stream | tee "/Users/chandlerroth/Documents/Data/Videos/$youtube_id"-wisdom.md;
}

function etw() {
    cat $1 | extract_wisdom --stream | tee "/Users/chandlerroth/Documents/Data/Wisdom/$(date +%Y%m%d%H%M%S)-${1%.*}"-wisdom.md;
}

compdef _files spk
compdef _files etw
