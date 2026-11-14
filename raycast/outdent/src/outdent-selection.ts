import { Clipboard, getSelectedText, showHUD } from "@raycast/api";
import { outdent } from "./outdent";

export default async function Command() {
  let text: string;
  try {
    text = await getSelectedText();
  } catch {
    await showHUD("No text selected");
    return;
  }
  await Clipboard.copy(outdent(text));
  await showHUD("Selection outdented to clipboard");
}
