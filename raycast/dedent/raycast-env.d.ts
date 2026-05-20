/// <reference types="@raycast/api">

/* 🚧 🚧 🚧
 * This file is auto-generated from the extension's manifest.
 * Do not modify manually. Instead, update the `package.json` file.
 * 🚧 🚧 🚧 */

/* eslint-disable @typescript-eslint/ban-types */

type ExtensionPreferences = {}

/** Preferences accessible in all the extension's commands */
declare type Preferences = ExtensionPreferences

declare namespace Preferences {
  /** Preferences accessible in the `dedent-clipboard` command */
  export type DedentClipboard = ExtensionPreferences & {}
  /** Preferences accessible in the `dedent-selection` command */
  export type DedentSelection = ExtensionPreferences & {}
  /** Preferences accessible in the `dedent-clipboard-and-paste` command */
  export type DedentClipboardAndPaste = ExtensionPreferences & {}
}

declare namespace Arguments {
  /** Arguments passed to the `dedent-clipboard` command */
  export type DedentClipboard = {}
  /** Arguments passed to the `dedent-selection` command */
  export type DedentSelection = {}
  /** Arguments passed to the `dedent-clipboard-and-paste` command */
  export type DedentClipboardAndPaste = {}
}

