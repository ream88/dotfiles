import { describe, expect, it } from "vitest";
import { joinLines, outdent } from "./outdent";

const lines = (...l: string[]) => l.join("\n");

// Ported from zed-industries/zed crates/editor/src/editor_tests.rs.
// Zed outdents only the selected rows; here every line is selected.
describe("outdent (Zed backtab)", () => {
  // test_indent_outdent, tab_size = 4
  it("removes one tab stop of spaces", () => {
    expect(outdent(lines("    one two", "three", " four"), 4)).toBe(
      lines("one two", "three", "four"),
    );
  });

  it("outdents an indented line next to an unindented one", () => {
    expect(outdent(lines("one two", "    three", " four"), 4)).toBe(
      lines("one two", "three", "four"),
    );
  });

  it("outdents every indented line by one level", () => {
    expect(outdent(lines("one two", "    three", "    four"), 4)).toBe(
      lines("one two", "three", "four"),
    );
  });

  // IndentSize::outdent_len: go back to the previous tab stop
  it("removes only the columns past the previous tab stop", () => {
    expect(outdent(lines("      one", "     two", "        three"), 4)).toBe(
      lines("    one", "    two", "    three"),
    );
  });

  // test_indent_outdent_with_hard_tabs
  it("removes one hard tab per press", () => {
    const once = outdent(lines("\t\tone two", "three", "four"));
    expect(once).toBe(lines("\tone two", "three", "four"));
    expect(outdent(once)).toBe(lines("one two", "three", "four"));
  });

  it("outdents a hard-tabbed line across a line ending", () => {
    expect(outdent(lines("one two", "\t\tthree", "four"))).toBe(
      lines("one two", "\tthree", "four"),
    );
  });

  it("leaves unindented lines alone", () => {
    expect(outdent(lines("one two", "three", "four"))).toBe(
      lines("one two", "three", "four"),
    );
  });
});

describe("outdent with the default tab size of 2", () => {
  it("outdents text whose first line was copied without its indent", () => {
    const input = lines(
      "Lorem ipsum dolor sit amet",
      "",
      "  Consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
      "",
      "  - Ut enim: ad minim veniam, quis nostrud exercitation",
      "    ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "  - Duis aute: irure dolor in reprehenderit in voluptate.",
    );
    expect(outdent(input)).toBe(
      lines(
        "Lorem ipsum dolor sit amet",
        "",
        "Consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
        "",
        "- Ut enim: ad minim veniam, quis nostrud exercitation",
        "  ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        "- Duis aute: irure dolor in reprehenderit in voluptate.",
      ),
    );
  });

  it("removes one level only, like a single Shift+Tab", () => {
    expect(outdent(lines("    docker run -d \\", "        --name web"))).toBe(
      lines("  docker run -d \\", "      --name web"),
    );
  });

  it("handles an empty string", () => {
    expect(outdent("")).toBe("");
  });
});

describe("joinLines", () => {
  it("joins a wrapped command into a single line", () => {
    const input = lines(
      "echo '10.0.0.181 nerves-e870' | sudo tee -a",
      "  /etc/hosts",
    );
    expect(joinLines(input)).toBe(
      "echo '10.0.0.181 nerves-e870' | sudo tee -a /etc/hosts",
    );
  });

  it("joins lines at the same indentation", () => {
    expect(joinLines("  git branch -D\n  dev\n")).toBe("git branch -D dev");
  });

  it("drops backslash continuations", () => {
    const input = lines("  curl example.com \\", "    -v \\", "    -o out");
    expect(joinLines(input)).toBe("curl example.com -v -o out");
  });

  it("drops blank lines and surrounding newlines", () => {
    expect(joinLines("\n  foo\n\n  bar\n\n")).toBe("foo bar");
  });

  it("handles CRLF line endings", () => {
    expect(joinLines("foo\r\n  bar\r\n")).toBe("foo bar");
  });

  it("handles an empty string", () => {
    expect(joinLines("")).toBe("");
  });
});
