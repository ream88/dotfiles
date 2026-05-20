export function dedent(text: string): string {
  const lines = text.split("\n");

  const merged: string[] = [];
  const bases: number[] = [];
  for (const line of lines) {
    const indent = line.length - line.replace(/^[ \t]+/, "").length;
    const isBlank = line.replace(/[ \t]+$/, "").length === 0;

    if (merged.length > 0 && !isBlank) {
      const prev = merged[merged.length - 1].replace(/[ \t]+$/, "");
      if (
        prev.length > 0 &&
        !prev.endsWith("\\") &&
        indent > bases[bases.length - 1]
      ) {
        merged[merged.length - 1] = `${prev} ${line.trim()}`;
        continue;
      }
    }
    merged.push(line);
    bases.push(indent);
  }

  let common: string | null = null;
  for (const line of merged) {
    const stripped = line.replace(/^[ \t]+/, "");
    if (stripped.length === 0) continue;

    const leading = line.slice(0, line.length - stripped.length);
    if (common === null) {
      common = leading;
    } else {
      let i = 0;
      const max = Math.min(common.length, leading.length);
      while (i < max && common[i] === leading[i]) i++;
      common = common.slice(0, i);
    }
    if (common === "") break;
  }

  const prefix = common ?? "";
  return merged
    .map((line) => {
      if (line.replace(/[ \t]+$/, "").length === 0) return "";
      const dedented = line.startsWith(prefix)
        ? line.slice(prefix.length)
        : line;
      return dedented.replace(/[ \t]+$/, "");
    })
    .join("\n");
}
