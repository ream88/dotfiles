# OS X shortcuts
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias rmdsstores='find ./ -type f | grep .DS_Store | xargs rm'
alias sleep='pmset sleepnow'


# Git
alias gd='git diff'
alias gap='git add -p'
alias glo='git log --oneline'

# Programming
alias j='jasmine-headless-webkit --color'


# Other
alias nw='/Applications/node-webkit.app/Contents/MacOS/node-webkit'
alias lisa='ls -lisa'
# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias updatedb='sudo /usr/libexec/locate.updatedb'

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
