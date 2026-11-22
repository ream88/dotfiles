import { Clipboard, showHUD } from "@raycast/api";
import { joinLines } from "./outdent";

export default async function Command() {
  const text = await Clipboard.readText();
  if (!text) {
    await showHUD("Clipboard is empty");
    return;
  }
  await Clipboard.paste(joinLines(text));
}
