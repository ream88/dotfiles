import { Clipboard, getSelectedText, showHUD } from "@raycast/api";
import { dedent } from "./dedent";

export default async function Command() {
  let text: string;
  try {
    text = await getSelectedText();
  } catch {
    await showHUD("No text selected");
    return;
  }
  await Clipboard.copy(dedent(text));
  await showHUD("Selection dedented to clipboard");
}
