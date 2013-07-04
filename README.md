These are config files and commands to set up a system the way I like it.

```sh
$ ip [-e] # Returns current (Wi-fi) IP address or current external IP address.
```

```sh
$ cb # Returns clipboard content.
$ ls | cb # Sets clipboard content.
```

## Installation

```sh
$ git clone git://github.com/haihappen/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles && rake
```

You can remove them easily too!

```sh
$ cd ~/.dotfiles && rake uninstall
$ cd ~ && rm -rf ~/.dotfiles
```

### Installing the LaunchAgents

```sh
$ mkdir ~/Library/LaunchAgents && cd $_
$ cp /Your/Download/Directory/*.plist .
$ find com.user* | xargs launchctl load
```

### Uninstalling

```sh
$ cd ~Library/LaunchAgents
$ find com.user* | xargs launchctl unload
```

## Copyright

(The MIT license)

Copyright (c) 2011-2013 Mario Uher

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
