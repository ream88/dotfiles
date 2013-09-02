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

## Apps

I'm working (as a web developer) with these apps on a daily basis.

Icon | Name | Description
----:|------|------------
![Sublime Text](Resources/Sublime Text.png) | [Sublime Text](http://www.sublimetext.com/3) | Atm the best editor available. Check this [post](http://blog.alexmaccaw.com/sublime-text) for the perfect setup.
![Transmit](Resources/Transmit.png) | [Transmit](http://panic.com/transmit/) | "The ultimate Mac OS X FTP + SFTP + S3 app."
![Kaleidoscope](Resources/Kaleidoscope.png) | [Kaleidoscope](http://www.kaleidoscopeapp.com) | Diff app with nice UI.
![Dash](Resources/Dash.png) | [Dash](http://kapeli.com/dash) | Offline docs.
![Sequel Pro](Resources/Sequel Pro.png) | [Sequel Pro](http://www.sequelpro.com) | MySQL Client for OS X.
![Hues](Resources/Hues.png) | [Hues](http://giantcomet.com/hues/) | Color picker.
![iOS Simulator](Resources/iOS Simulator.png) | [iOS Simulator](https://developer.apple.com/xcode/) | Test your design on iOS devices.
![xScope](Resources/xScope.png) | [xScope](http://iconfactory.com/software/xscope) | Measure different things.
![ImageOptim](Resources/ImageOptim.png) | [ImageOptim](http://imageoptim.com) | Optimize your images for the web.
![Pixelmator](Resources/Pixelmator.png) | [Pixelmator](http://www.pixelmator.com) | "Photoshop for the rest of us."
![Sketch](Resources/Sketch.png) | [Sketch](http://www.bohemiancoding.com/sketch/) | Illustrator for the rest of us.
![Anvil](Resources/Anvil.png) | [Anvil](http://anvilformac.com) | "Run your sites locally."
![Tower](Resources/Tower.png) | [Tower](http://www.git-tower.com) | Sometimes git needs an UI.

Tools life is hard without.

Icon | Name | Description
----:|------|------------
![1Password](Resources/1Password.png) | [1Password](https://agilebits.com/onepassword) | Remember one password!
![AppCleaner](Resources/AppCleaner.png) | [AppCleaner](http://www.freemacsoft.net/appcleaner/) | Uninstall all the stuff!
![Automator](Resources/Automator.png) | [Automator](http://support.apple.com/kb/HT2488?viewlocale=en_US&locale=en_US) | Automate all the stuff!
![BetterZip](Resources/BetterZip.png) | [BetterZip](http://macitbetter.com) | Better zips! ;)
![The Unarchiver](Resources/The Unarchiver.png) | [The Unarchiver](http://wakaba.c3.cx/s/apps/unarchiver.html) | Better Archive Utility.app.
![Skitch](Resources/Skitch.png) | [Skitch](http://evernote.com/skitch/) | Take screenshots and annotate them.
![Ember](Resources/Ember.png) | [Ember](http://realmacsoftware.com/ember) | Take screenshots and annotate them - the second.
![iA Writer](Resources/iA Writer.png) | [iA Writer](http://www.iawriter.com/mac/) | "Keep your hands on the keyboard and your mind in the text." - Write Markdown.
![Mou](Resources/Mou.png) | [Mou]() | Write Markdown - the second.
![Collective](Resources/Collective.png) | [Collective](http://www.generation-loss.com/collective/) | "Clipboard History for Mac OS X. Done Right."
![Moom](Resources/Moom.png) | [Moom](http://manytricks.com/moom/) | Better window handling for OS X.

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
