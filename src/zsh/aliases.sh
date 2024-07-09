# macOS shortcuts
alias rm=trash # brew install trash
alias mute="osascript -e 'set volume with output muted'"
alias unmute="osascript -e 'set volume without output muted'"

# Git
alias gd="git diff"
alias gu="gitup"
alias gpu="git push -u"
alias glc="git rev-parse HEAD"

git-delete-squashed() {
    MAIN_BRANCH="${1:-main}"
    git checkout -q $MAIN_BRANCH && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base $MAIN_BRANCH $branch) && [[ $(git cherry $MAIN_BRANCH $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done
}

git-reset-harder() {
    git reset --hard && git clean -df
}

# Change theme of Terminal.app
tabc() {
    NAME="${1:-Basic}"
    osascript -e "tell application \"Terminal\" to set current settings of front window to settings set \"$NAME\""
}

# Change to Danger theme when executing ssh
ssh() {
    tabc Pro
    /usr/bin/ssh $*
    tabc
}

# Docker
alias compose='docker compose'
alias test-compose='compose -f /Users/mario/Code/yodel/yodel/docker-compose.test.yml'

alias bu='bundle update'
alias bl='bundle list'

evalenv() {
    YELLOW='\033[1;33m'
    NO_COLOR='\033[0m'

    case "$1" in
    "")
        evalenv .env
        ;;

    ".")
        echo -e "${YELLOW}Warning:${NO_COLOR} You probably meant to call evalenv without an argument. I took care of it for you!"
        evalenv .env
        ;;

    *)
        set -o allexport
        source "$1"
        set o allexport
        ;;
    esac
}

whatisusing() {
    lsof -i tcp:$1
}

# TryHackMe
alias rustscan='docker run -it --rm --name rustscan rustscan/rustscan'

# Use youtube-dl fork because of slow downloads
alias youtube-dl='yt-dlp'

alias rgf='rg --files | rg'

# Integrate rg into vscode
if [[ "$TERM_PROGRAM" == 'vscode' ]]; then
    alias 'rg'='rg --smart-case --hidden --no-heading --column'
else
    alias 'rg'='rg --smart-case --hidden'
fi
