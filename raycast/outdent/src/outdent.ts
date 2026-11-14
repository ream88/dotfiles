// ponytail: hardcoded to match "tab_size" in src/config/zed/settings.json
const TAB_SIZE = 2;

// Port of Zed's IndentSize::outdent_len (crates/language/src/buffer.rs):
// spaces go back to the previous tab stop, tabs lose one character.
function outdentLen(line: string, tabSize: number): number {
  const indent = line.match(/^[ \t]*/)![0];
  if (indent.length === 0) return 0;
  if (indent[0] === "\t") return 1;
  return indent.length % tabSize || tabSize;
}

/** One Shift+Tab in Zed with every line selected (Editor::outdent). */
export function outdent(text: string, tabSize = TAB_SIZE): string {
  return text
    .split("\n")
    .map((line) => line.slice(outdentLen(line, tabSize)))
    .join("\n");
}
