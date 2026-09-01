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
# -g installs user-level rather than into whatever directory this is run from,
# -y skips the prompts, -a links them into ~/.claude/skills.
grep -o '"source": "[^"]*"' "$HOME/.dotfiles/src/agents/.skill-lock.json" |
  cut -d'"' -f4 | sort -u |
  while read -r source; do
    echo "bunx skills add -g -y -a claude $source"
  done
