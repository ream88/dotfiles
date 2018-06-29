# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#
# Custom theme: https://github.com/ream88/ream88.zsh-theme
ZSH_THEME="ream88"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  brew
  brew-cask
  docker
  docker-compose
  dotenv
  elm
  gem
  git
  heroku
  mix
  npm
  osx
  rake-fast

  zsh-completions
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases.sh

# Don't correct arguments
unsetopt correct_all
setopt correct

# Autocomplete path, so `cd rails` jumpts to `~/Code/Other/rails`
cdpath=(. ~ ~/Code/ ~/Code/* ~/Code/yodel/yodel/)

# Customize to your needs...
export PATH=\
/usr/local/heroku/bin:\
/Users/mario/.bin:\
/usr/local/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
/usr/X11/bin:\
/usr/local/sbin:\
/usr/local/share/npm/bin:\
/usr/local/opt/postgresql@9.4/bin:\
/usr/local/opt/go/libexec/bin:\
/Users/mario/.go/bin

# Bundle editor, a.k.a editor which will be opened after `bundle open rails`.
export EDITOR=atom

# Paths
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export GOPATH="/Users/mario/.go"

# Wildcard search
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

# added by travis gem
[ -f /Users/mario/.travis/travis.sh ] && source /Users/mario/.travis/travis.sh

# Use gpg-agent for git rebase and so on. Be sure to have use-agent config set properly.
export GPG_TTY=$(tty)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ERL_AFLAGS="-kernel shell_history enabled"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/mario/Code/Other/elm-serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mario/Code/Other/elm-serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/mario/Code/Other/elm-serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/mario/Code/Other/elm-serverless/node_modules/tabtab/.completions/sls.zsh

# asdf
source /usr/local/opt/asdf/asdf.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
