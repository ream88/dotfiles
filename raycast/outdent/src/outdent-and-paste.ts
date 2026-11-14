import { Clipboard, showHUD } from "@raycast/api";
import { outdent } from "./outdent";

export default async function Command() {
  const text = await Clipboard.readText();
  if (!text) {
    await showHUD("Clipboard is empty");
    return;
  }
  await Clipboard.paste(outdent(text));
}
