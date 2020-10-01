# Clarity.ml

[![Project license](https://img.shields.io/badge/license-Public%20Domain-blue.svg)](https://unlicense.org)
[![Discord](https://img.shields.io/discord/755852964513579099?label=discord)](https://discord.gg/KqETNBj)

**Clarity.ml** parses [Clarity] smart contracts into an abstract syntax tree.

## Installation

```bash
opam pin add -y clarity-lang https://github.com/weavery/clarity.ml -k git
```

## Development

This section documents how to get set up with a development environment for
building Clarity.ml from source code. It is only of interest to people who wish
to contribute to Clarity.ml.

### Prerequisites

The following baseline tooling is required in order to build Clarity.ml from
source code:

- [Git](https://git-scm.com/downloads)

- [OCaml] 4.11+

- [OPAM](https://opam.ocaml.org)

- [Dune](https://dune.build)

### Dependencies

The following OCaml tools and libraries are required in order to build
Clarity.ml from source code:

- [Alcotest](https://opam.ocaml.org/packages/alcotest/)
  for unit tests

- [Cppo](https://opam.ocaml.org/packages/cppo/)
  for code preprocessing

- [Menhir](https://opam.ocaml.org/packages/menhir/)
  for parsing

- [Num](https://opam.ocaml.org/packages/num/)
  for 128-bit integers

These aforementioned dependencies are all best installed via OPAM:

```bash
opam install -y alcotest cppo menhir num
```

### Installing from source code

```bash
git clone https://github.com/weavery/clarity.ml.git

cd clarity.ml

dune build

dune install
```

## Acknowledgments

We thank [Arweave] and the [Stacks Foundation] for sponsoring the development
of this project as part of the development of [Sworn] and [Clarc], respectively.

[Arweave]:           https://arweave.org
[Clarc]:             https://github.com/weavery/clarc
[Clarity]:           https://clarity-lang.org
[OCaml]:             https://ocaml.org
[Stacks Foundation]: https://stacks.org
[Sworn]:             https://github.com/weavery/sworn
