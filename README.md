# Leaf Template Support for Zed
This extension adds syntax highlighting support for Leaf templates in the Zed IDE.

## Features

- Syntax highlighting for Leaf template syntax
- Support for Leaf directives (e.g., `#if`, `#for`, `#extend`, `#export`), variables, and tags
- Compatibility with `.leaf` file extensions
- Highlighting for HTML files containing Leaf syntax

## Installation

Install through the Zed extension marketplace:

1. Open the Zed IDE
2. Navigate to Extensions (`zed: extensions`)
3. Search for "Leaf"
4. Select and install the extension

## Usage

The extension activates automatically for supported file types. No additional configuration is required.

## Compatibility

This extension is built for projects using Leaf templates, specifically targeting:

- Vapor web applications (Swift)
- Any other Swift-based web frameworks or projects utilizing the Leaf templating engine

## Acknowledgments

This extension is powered by and would not be possible without the excellent [tree-sitter-leaf](https://github.com/visualbam/tree-sitter-leaf) parser created by [visualbam](https://github.com/visualbam). Massive thanks to them for their foundational work on the grammar.

## Known Issues

As this is an early beta release, there are a few known syntax highlighting edge cases we are currently tracking:

1. **Injection Failures:** CSS and JavaScript injection inside `<style>` and `<script>` blocks is currently not working as expected.
2. **Built-in Functions:** Built-in Leaf functions (e.g., `count()`) are not being highlighted with the correct function colors in all contexts.
3. **HTML Tag Boundaries:** Self-closing tags (like `<img />`) and certain nested HTML tags are occasionally missing their proper bracket highlighting or bleeding into string literal colors.

## Issues and Contributions

For bug reports, feature requests, or contributions to help resolve the known issues above, please open an issue or pull request on the GitHub repository.

## Roadmap

- Resolve Tree-sitter query conflicts for HTML tag boundaries and script/style injections.
- Explore adding a language server for advanced auto-completion and diagnostics.
