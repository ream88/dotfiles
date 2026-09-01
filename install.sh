#!/bin/sh
set -e

if [ ! -d "$HOME/.dotfiles" ]; then
  git clone --recurse-submodules https://github.com/ream88/dotfiles.git $HOME/.dotfiles
fi

# The ln lines are printed, not run: this script generates the commands and you
# pipe them to sh to apply them. `sh install.sh` on its own is a dry run.
install() {
  for from in $1/*; do
    # src/agents holds only a dotfile, so the glob finds nothing and leaves the
    # pattern itself. Without this the link below is named "*".
    [ -e "$from" ] || continue

    basename=$(basename $from)

    mkdir -pv $2

    if [ -d $from ] && [ ! -e "$from/.git" ]; then
      # The destination may already be a symlink back into this repo, and then
      # every ln generated below it resolves through that link to the source
      # and replaces the file with a link to itself. Leave it alone: it already
      # points where the recursion was going to put things.
      [ -L "$2$basename" ] && continue

      install $from "$2$basename/"
    else
      echo ln -sfvn $from "$2$basename"
    fi
  done
}

install "$HOME/.dotfiles/src" "$HOME/."

# ponytail: install()'s glob skips dotfiles, so link the skills lockfile explicitly
mkdir -p "$HOME/.agents"
echo ln -sfvn "$HOME/.dotfiles/src/agents/.skill-lock.json" "$HOME/.agents/.skill-lock.json"

# Reinstall skills from the lockfile (grep instead of jq, which macOS lacks).
# Printed like the ln lines above, one per source, so nothing is fetched until
# you pipe this to sh — which is also why there is no "only on a fresh machine"
# guard: printing costs nothing, and a hidden command is one you cannot run.
#
# The source goes first because --agent takes a list: `-a claude-code $source`
# swallows the source and fails with "Missing required argument". The agent is
# claude-code, not claude. -g installs user-level rather than into whatever
# directory this is run from, and -y skips the prompts. </dev/null because sh
# reads this script FROM stdin: without it the first skills add drains the
# remaining lines as its own input and nothing after it runs.
grep -o '"source": "[^"]*"' "$HOME/.dotfiles/src/agents/.skill-lock.json" |
  cut -d'"' -f4 | sort -u |
  while read -r source; do
    echo "bunx skills add $source -g -y -a claude-code </dev/null"
  done

# Last, so it is what is left on screen after the commands scroll past. Every
# line is a comment, so piping this whole script to a shell stays valid, and
# the colour goes after the leading # so that stays true.
red=''
reset=''
if [ -t 1 ]; then
  red=$(printf '\033[1;31m')
  reset=$(printf '\033[0m')
fi

cat <<'BANNER' | sed "s/^#/#$red/;s/\$/$reset/"

#                           _
# __      ____ _ _ __ _ __ (_)_ __   __ _
# \ \ /\ / / _` | '__| '_ \| | '_ \ / _` |
#  \ V  V / (_| | |  | | | | | | | | (_| |
#   \_/\_/ \__,_|_|  |_| |_|_|_| |_|\__, |
#                                   |___/
#
# Nothing above has run. These are commands, printed for you to read first.
# To actually apply them:
#
#     sh ~/.dotfiles/install.sh | sh
#
BANNER
