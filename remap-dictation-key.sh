#!/bin/zsh
# Remap the mic/Dictation key (HID consumer usage 0xC000000CF) to a normal
# F-key, so apps like Raycast can record it as a hotkey (they ignore the raw
# consumer usage). hidutil mappings are wiped on sleep/wake and reboot, so a
# LaunchDaemon re-applies it on load and every 10s.
#
#   sudo ./remap-dictation-key.sh                  # install, default F19
#   sudo ./remap-dictation-key.sh 0x70000006D      # install, map to F18 instead
#   sudo ./remap-dictation-key.sh uninstall        # remove everything
#
# F-key HID codes: F13 0x68 F14 0x69 F15 0x6A F16 0x6B F17 0x6C
#                  F18 0x6D F19 0x6E F20 0x6F  (prefix each with 0x700000_)
set -e

LABEL=local.remap-dictation-key
PLIST=/Library/LaunchDaemons/$LABEL.plist
SCRIPT=/usr/local/bin/remap-dictation-key.sh
SRC=0xC000000CF              # mic/Dictation key
DST=${1:-0x70000006E}       # target keycode, default F19

[[ $EUID -eq 0 ]] || { echo "run with sudo" >&2; exit 1; }

if [[ $1 == uninstall ]]; then
  launchctl bootout system/$LABEL 2>/dev/null || true
  rm -f $PLIST $SCRIPT
  hidutil property --set '{"UserKeyMapping":[]}' >/dev/null
  echo "removed; mic key restored to default"
  exit 0
fi

cat >$SCRIPT <<EOF
#!/bin/zsh
/usr/bin/hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":$SRC,"HIDKeyboardModifierMappingDst":$DST}]}'
EOF
chmod +x $SCRIPT

cat >$PLIST <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key><string>$LABEL</string>
  <key>ProgramArguments</key><array><string>$SCRIPT</string></array>
  <key>RunAtLoad</key><true/>
  <key>StartInterval</key><integer>10</integer>
</dict>
</plist>
EOF
chown root:wheel $PLIST
chmod 644 $PLIST

launchctl bootout system/$LABEL 2>/dev/null || true
launchctl bootstrap system $PLIST
launchctl kickstart -k system/$LABEL

echo "installed. current mapping:"
hidutil property --get UserKeyMapping
