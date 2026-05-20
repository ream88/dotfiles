import { Clipboard, showHUD } from "@raycast/api";
import { dedent } from "./dedent";

export default async function Command() {
  const text = await Clipboard.readText();
  if (!text) {
    await showHUD("Clipboard is empty");
    return;
  }
  await Clipboard.copy(dedent(text));
  await showHUD("Clipboard dedented");
}
