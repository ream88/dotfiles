# OS X shortcuts
alias rmdsstores='find ./ -type f | grep .DS_Store | xargs rm'
alias rm=trash # brew install trash

# Git
alias gd='git diff'
alias gu='gitup'
alias git-delete-squashed='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
alias gpu='git push -u'

# gt is alias for gittower .
gt() {
    gittower $(git rev-parse --show-toplevel)
}

# Change theme of Terminal.app
tabc() {
    NAME="${1:-Default}"
    osascript -e "tell application \"Terminal\" to set current settings of front window to settings set \"$NAME\""
}

# Change to Danger theme when executing ssh
ssh() {
    tabc Danger
    /usr/bin/ssh $*
    tabc
}

# Docker
alias machine='docker-machine'
alias compose='docker-compose'
alias swarm='docker-swarm'
alias test-compose='compose -f /Users/mario/Code/yodel/yodel/docker-compose.test.yml'

alias bu='bundle update'
alias bl='bundle list'

evalenv() {
    if [ "$1" != "" ]; then
        eval $(awk '{printf "export %s\n", $0}' $1)
    else
        eval $(awk '{printf "export %s\n", $0}' .env)
    fi
}

alias y='/Users/mario/Code/yodel/yodel/yodel.sh'
