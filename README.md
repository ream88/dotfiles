These are config files, [fixes](Fixes.md) and [commands](Commands.md) to set up a system the way I like it.

## Installation

### Homebrew
```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### oh-my-zsh and custom theme
```sh
curl -L http://install.ohmyz.sh | sh
curl -L https://raw.githubusercontent.com/ream88/ream88.zsh-theme/master/ream88.zsh-theme > ~/.oh-my-zsh/themes/ream88.zsh-theme
```

### dotfiles
```sh
cd; git clone git://github.com/ream88/dotfiles.git ~/.dotfiles; cd ~/.dotfiles; ruby install.rb
```

### Useful tools

```sh
brew install fd rg fsevents-tools gpg pinentry-mac
```

- `fd`: https://github.com/sharkdp/fd - A simple, fast and user-friendly alternative to 'find'
- `rg`: https://github.com/BurntSushi/ripgrep
- `fsevent-tools`: https://github.com/ggreer/fsevents-tools - provides both `notifywait` and `notifyloop`

### Other useful stuff:

- Fix problems with `gpg` and `pinentry-mac`: https://stackoverflow.com/a/55646458/326984

## Copyright

See [LICENSE.md (The MIT license)](LICENSE.md).
