(lang dune 2.7)
(name clarity)
(version 0.1.0)

(generate_opam_files true)

(package
 (name clarity)
 (synopsis "Clarity smart contract parser and AST")
 (description "Clarity.ml parses Clarity smart contracts into an abstract syntax tree.")
 (depends
  (alcotest :with-test)
  (menhir (>= 20200624))
  (num (>= 1.3))))

(source (github weavery/clarity.ml))
(license Unlicense)
(authors "Arto Bendiken <arto@bendiken.net>")
(maintainers "Arto Bendiken <arto@bendiken.net>")

(using menhir 2.0)
