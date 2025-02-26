if [[ -s "$HOME/.env" ]]; then
    export $(echo -e $(cat $HOME/.env))
fi

if [[ $(arch) = "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

OBSIDIAN_VAULT="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Default"
ZSH_THEME="robbyrussell"
plugins=(git web-search)

export ZSH_DISABLE_COMPFIX=true
export ZSH="$HOME/.oh-my-zsh"
export PYENV_ROOT="$HOME/.pyenv"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="$HOME/.sst/bin":$PATH
export PATH="$HOME/Projects/chandlerroth/linear-ops/bin":$PATH

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

source $ZSH/oh-my-zsh.sh

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

if [ -f "$HOME/.config/fabric/fabric-bootstrap.inc" ]; then . "$HOME/.config/fabric/fabric-bootstrap.inc"; fi

alias mac="~/.bundle.sh"
alias dc="docker compose"
alias myip="curl -s ipinfo.io/json | jq -r '.[\"ip\"]'"
alias prlog="git --no-pager log $(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')..$(git branch --show-current) --reverse --oneline --no-decorate"
alias gitpf="~/.git-force-pull.sh"
alias code="zed"

function ytd() {
    local youtube_id=$(echo "$1" | sed -E 's#(https?://)?(www\.)?youtube\.com/watch\?v=##; s#(https?://)?(www\.)?youtu\.be/##; s#(https?://)?(www\.)?youtube\.com/shorts/##; s/&.*//; s/\?.*//;')

    yt-dlp "$1" -f mp4 -o "$OBSIDIAN_VAULT/Data/Videos/$youtube_id".mp4;
}

function silent() {
    $1 > /dev/null 2>&1;
};

function gaw() {
    go-readability "$1" | html2md -i | tee "$OBSIDIAN_VAULT/Data/Articles/${1##*/}".md | extract_article_wisdom --stream | tee "$OBSIDIAN_VAULT/Data/Articles/${1##*/}"-wisdom.md;
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

    ytd "$1" && yt --transcript "$1" | tee "$OBSIDIAN_VAULT/Data/Videos/$youtube_id".txt | extract_wisdom --stream | tee "$OBSIDIAN_VAULT/Data/Videos/$youtube_id"-wisdom.md;
}

function etw() {
    cat $1 | extract_wisdom --stream | tee "$OBSIDIAN_VAULT/Data/Wisdom/$(date +%Y%m%d%H%M%S)-${1%.*}"-wisdom.md;
}

prj() {
    if [ "$1" = "cd" ] || [[ "$1" =~ ^[0-9]+$ ]]; then
        cd "$(command prj "$@")"
    else
        command prj "$@"
    fi
}

compdef _files spk
compdef _files etw

# bun
[ -s "/Users/chandler/.bun/_bun" ] && source "/Users/chandler/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
