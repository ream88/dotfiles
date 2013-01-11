# OS X shortcuts
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias rmdsstores='find ./ -type f | grep .DS_Store | xargs rm'
alias sleep='pmset sleepnow'


# Git
alias gd='git diff'
alias gap='git add -p'


# Programming
alias j='jasmine-headless-webkit --color'


# Other
alias lisa='ls -lisa'

# Change theme of Terminal.app
tabc() {
  NAME="${1:-Default}"
  osascript -e "tell application \"Terminal\" to set current settings of front window to settings set \"$NAME\""
}

# Change to Danger theme when executing ssh
ssh() {
  tabc Danger
  /usr/bin/ssh "$*"
  tabc
}
