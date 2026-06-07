import { describe, expect, it } from "vitest";
import { dedent } from "./dedent";

describe("dedent", () => {
  it("strips common leading whitespace and preserves relative indent", () => {
    const input = [
      "  curl -X POST https://api.example.com/items \\",
      '    -H "Authorization: Bearer $TOKEN" \\',
      '    -H "Content-Type: application/json" \\',
      '    -d \'{"name": "widget"}\'',
    ].join("\n");

    const expected = [
      "curl -X POST https://api.example.com/items \\",
      '  -H "Authorization: Bearer $TOKEN" \\',
      '  -H "Content-Type: application/json" \\',
      '  -d \'{"name": "widget"}\'',
    ].join("\n");

    expect(dedent(input)).toBe(expected);
  });

  it("handles a kubectl-style continuation block", () => {
    const input = [
      "    kubectl run nginx \\",
      "      --image=nginx:latest \\",
      "      --port=80 \\",
      "      --restart=Never",
    ].join("\n");

    const expected = [
      "kubectl run nginx \\",
      "  --image=nginx:latest \\",
      "  --port=80 \\",
      "  --restart=Never",
    ].join("\n");

    expect(dedent(input)).toBe(expected);
  });

  it("handles a docker run block with deeper continuation indent", () => {
    const input = [
      "    docker run -d \\",
      "        --name web \\",
      "        -p 8080:80 \\",
      "        nginx",
    ].join("\n");

    const expected = [
      "docker run -d \\",
      "    --name web \\",
      "    -p 8080:80 \\",
      "    nginx",
    ].join("\n");

    expect(dedent(input)).toBe(expected);
  });

  it("joins a wrapped continuation line into the line above", () => {
    const input = ["git branch -D", "  dev"].join("\n");
    expect(dedent(input)).toBe("git branch -D dev");
  });

  it("joins multiple wrapped continuation lines", () => {
    const input = ["git branch -D", "  dev", "  staging"].join("\n");
    expect(dedent(input)).toBe("git branch -D dev staging");
  });

  it("joins a tab-indented wrapped line", () => {
    const input = ["git push", "\torigin"].join("\n");
    expect(dedent(input)).toBe("git push origin");
  });

  it("does not join an explicit backslash continuation", () => {
    const input = ["  curl example.com \\", "    -v"].join("\n");
    expect(dedent(input)).toBe("curl example.com \\\n  -v");
  });

  it("does not join lines at the same indentation", () => {
    const input = ["echo first", "echo second"].join("\n");
    expect(dedent(input)).toBe("echo first\necho second");
  });

  it("strips trailing whitespace from every line", () => {
    const input = "  hello   \n  world\t\t\n";
    expect(dedent(input)).toBe("hello\nworld\n");
  });

  it("collapses whitespace-only lines to empty", () => {
    const input = ["  foo", "    ", "  bar"].join("\n");
    expect(dedent(input)).toBe("foo\n\nbar");
  });

  it("handles a single line", () => {
    expect(dedent("        only one line")).toBe("only one line");
  });

  it("handles an empty string", () => {
    expect(dedent("")).toBe("");
  });

  it("preserves the trailing newline", () => {
    expect(dedent("  foo\n  bar\n")).toBe("foo\nbar\n");
  });

  it("dedents an indented block following a flush-left first line", () => {
    const input = [
      "Today this opens as an overlay.",
      "",
      "  I'd love a push variant where the",
      "  page shrinks to make room beside it.",
      "",
      "  Use case: a persistent panel.",
    ].join("\n");

    const expected = [
      "Today this opens as an overlay.",
      "",
      "I'd love a push variant where the",
      "page shrinks to make room beside it.",
      "",
      "Use case: a persistent panel.",
    ].join("\n");

    expect(dedent(input)).toBe(expected);
  });
});
