# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2020-10-xx

### Changed

- Clarity keywords (such as `block-height`) are now represented in the AST
  with `Keyword` nodes instead of `Identifier` nodes.

### Added

- Support for `let` expressions.

- Support for `match` expressions.

- Support for tuple expressions of the form `(tuple (name "blockstack") (id 1337))`.

## 0.1.0 - 2020-09-30

### Added

- The initial public release.

[0.1.1]: https://github.com/weavery/clarity.ml/compare/0.1.0...0.2.0
