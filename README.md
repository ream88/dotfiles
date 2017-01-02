These are config files and commands to set up a system the way I like it.

### ip

```sh
$ ip [-e] # Returns current (Wi-fi) IP address or current external IP address.
```

### cb

```sh
$ cb # Returns clipboard content.
$ ls | cb # Sets clipboard content.
```

## Installation

```sh
# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# oh-my-zsh
curl -L http://install.ohmyz.sh | sh

# dotfiles
cd; git clone git://github.com/haihappen/dotfiles.git ~/.dotfiles; source ~/.dotfiles/bootstrap.sh
```

# Fix non-breaking spaces in Terminal:
http://superuser.com/questions/78245/how-to-disable-the-option-space-key-combination-for-non-breaking-spaces
http://stackoverflow.com/questions/26756896/undefined-local-variable-or-method-for-mainobject

```sh
mkdir -p ~/Library/KeyBindings
cp DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
```

## Copyright

(The MIT license)

Copyright (c) 2012-2017 Mario Uher

See [LICENSE.md](LICENSE.md).
