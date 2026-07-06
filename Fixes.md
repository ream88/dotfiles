# Fix invisible spaces:

- http://superuser.com/questions/78245/how-to-disable-the-option-space-key-combination-for-non-breaking-spaces
- http://stackoverflow.com/questions/26756896/undefined-local-variable-or-method-for-mainobject

```sh
mkdir -p ~/Library/KeyBindings
cp ~/.dotfiles/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
```

# Stop the mic/F5 key from hijacking to macOS Dictation:

The microphone key is a dedicated Dictation HID usage (`0xC000000CF`), not plain
F5. `hidutil` can remap it to F5, but the mapping only lives while there's an
active keyboard service — it's wiped on sleep/wake or keyboard reconnect, so it
"works for a while then stops". A root LaunchDaemon reasserts it.

- https://developer.apple.com/library/archive/technotes/tn2450/_index.html

```sh
sudo zsh -c '
cat >/usr/local/bin/remap-dictation-key.sh <<EOF
#!/bin/zsh
/usr/bin/hidutil property --set "{\"UserKeyMapping\":[{\"HIDKeyboardModifierMappingSrc\":0xC000000CF,\"HIDKeyboardModifierMappingDst\":0x70000003E}]}"
EOF
chmod +x /usr/local/bin/remap-dictation-key.sh

cat >/Library/LaunchDaemons/local.remap-dictation-key.plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key><string>local.remap-dictation-key</string>
  <key>ProgramArguments</key><array><string>/usr/local/bin/remap-dictation-key.sh</string></array>
  <key>RunAtLoad</key><true/>
  <key>StartInterval</key><integer>10</integer>
  <key>KeepAlive</key><dict><key>PathState</key><dict><key>/dev</key><true/></dict></dict>
</dict>
</plist>
EOF
chown root:wheel /Library/LaunchDaemons/local.remap-dictation-key.plist
chmod 644 /Library/LaunchDaemons/local.remap-dictation-key.plist

launchctl bootout system /Library/LaunchDaemons/local.remap-dictation-key.plist 2>/dev/null || true
launchctl bootstrap system /Library/LaunchDaemons/local.remap-dictation-key.plist
launchctl kickstart -k system/local.remap-dictation-key
'
```

`0xC000000CF` → mic/dictation key, `0x70000003E` → F5. On Sequoia, if the mapping
stops being honored, add `/usr/bin/hidutil` under System Settings → Privacy &
Security → Input Monitoring. Uninstall:

```sh
sudo launchctl bootout system /Library/LaunchDaemons/local.remap-dictation-key.plist
sudo rm /Library/LaunchDaemons/local.remap-dictation-key.plist /usr/local/bin/remap-dictation-key.sh
hidutil property --set '{"UserKeyMapping":[]}'
```
