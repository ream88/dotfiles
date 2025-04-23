These are config files, [fixes](Fixes.md) and [commands](Commands.md) to set up a system the way I like it.

## Installation

- Homebrew: https://brew.sh

- oh-my-zsh and custom theme

  ```sh
  curl -L https://install.ohmyz.sh | sh
  curl -L https://raw.githubusercontent.com/ream88/ream88.zsh-theme/master/ream88.zsh-theme > ~/.oh-my-zsh/themes/ream88.zsh-theme
  ```

- dotfiles

  ```sh
  curl -L https://raw.githubusercontent.com/ream88/dotfiles/main/install.sh | sh
  ```

- Useful tools

  ```sh
  brew install \
    dasel \
    entr \
    fd \
    ffmpeg \
    gpg \
    mcfly \
    pinentry-mac \
    rg \
    TankerHQ/homebrew-repo/ruplacer \
    thefuck \
    trash \
    vips
  ```

  - `dasel`: https://github.com/TomWright/dasel - Better then `jq`?
  - `entr`: https://github.com/eradman/entr - Run commands when files change
  - `fd`: https://github.com/sharkdp/fd - A simple, fast and user-friendly alternative to `find`
  - `rg`: https://github.com/BurntSushi/ripgrep
  - `ruplacer`: https://github.com/your-tools/ruplacer
  - `thefuck`: https://github.com/nvbn/thefuck - Magnificent app which corrects your previous console command
  - `trash`: https://github.com/ali-rantakari/trash - Move files into trash instead of deleting them right away

## Other useful stuff:

- Fix problems with `gpg` and `pinentry-mac`: https://stackoverflow.com/a/55646458/326984

## Copyright

See [The MIT license](LICENSE).
