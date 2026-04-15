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
    claude-code \
    fd \
    ffmpeg \
    gh \
    gpg \
    mcfly \
    pinentry-mac \
    rg \
    TankerHQ/homebrew-repo/ruplacer \
    thefuck \
    trash
  ```

  - `claude-code`: https://github.com/anthropics/claude-code - Claude Code CLI
  - `fd`: https://github.com/sharkdp/fd - A simple, fast and user-friendly alternative to `find`
  - `gh`: https://github.com/cli/cli - GitHub CLI
  - `rg`: https://github.com/BurntSushi/ripgrep
  - `ruplacer`: https://github.com/your-tools/ruplacer
  - `thefuck`: https://github.com/nvbn/thefuck - Magnificent app which corrects your previous console command
  - `trash`: https://github.com/ali-rantakari/trash - Move files into trash instead of deleting them right away

## Previously used tools

  - `autoenv`: https://github.com/hyperupcall/autoenv - Directory-based environments
  - `atuin`: https://github.com/atuinsh/atuin - Shell history sync (replaced mcfly briefly, then reverted)
  - `dasel`: https://github.com/TomWright/dasel - JSON/YAML/TOML query tool
  - `entr`: https://github.com/eradman/entr - Run commands when files change
  - `http-server`: https://github.com/http-party/http-server - Simple static HTTP server
  - `vips`: https://github.com/libvips/libvips - Image processing library
  - `witr`: https://github.com/pranshuparmar/witr - Why Is This Running? Explains why processes are running

## Other useful stuff:

- Fix problems with `gpg` and `pinentry-mac`: https://stackoverflow.com/a/55646458/326984

## Copyright

See [The MIT license](LICENSE).
