# OS X shortcuts
alias rmdsstores='find ./ -type f | grep .DS_Store | xargs rm'

# Git
alias gd='git diff'
alias gap='git add -p'
alias glo='git log --oneline'
alias gu='gitup'

# gt is alias for gittower .
gt() {
  DIR="${1:-.}"
  gittower "$DIR"
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

# iOS Simulator
alias ios='open /Applications/Xcode.app/Contents/Applications/iPhone\ Simulator.app'

# Docker
alias machine='docker-machine'
alias compose='docker-compose'
alias swarm='docker-swarm'

alias bu='bundle update'
alias bl='bundle list'

alias hangout='open helium://plus.google.com/hangouts/_/beenetwork.eu/7s-developer'
