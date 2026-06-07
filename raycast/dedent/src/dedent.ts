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

  // Dedent each blank-line-delimited block by its own common prefix, so a
  // flush-left line in one block doesn't cancel the indent of another.
  const result: string[] = [];
  let block: string[] = [];

  const flush = () => {
    let common: string | null = null;
    for (const line of block) {
      const leading = line.slice(
        0,
        line.length - line.replace(/^[ \t]+/, "").length,
      );
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
    for (const line of block) {
      const dedented = line.startsWith(prefix)
        ? line.slice(prefix.length)
        : line;
      result.push(dedented.replace(/[ \t]+$/, ""));
    }
    block = [];
  };

  for (const line of merged) {
    if (line.replace(/[ \t]+$/, "").length === 0) {
      flush();
      result.push("");
    } else {
      block.push(line);
    }
  }
  flush();

  return result.join("\n");
}
