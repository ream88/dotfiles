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

Copyright (c) 2011-2016 Mario Uher

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
