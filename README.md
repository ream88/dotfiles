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
cd; git clone git://github.com/ream88/dotfiles.git ~/.dotfiles; ruby ~/.dotfiles/bootstrap.rb
```

### gpg (for [signing commits](https://help.github.com/articles/generating-a-new-gpg-key/)) and chruby
```sh
brew install gpg chruby
```

## Copyright

(The MIT license)

Copyright (c) 2012-2017 Mario Uher

See [LICENSE.md](LICENSE.md).
