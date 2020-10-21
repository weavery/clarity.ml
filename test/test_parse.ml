(* This is free and unencumbered software released into the public domain. *)

open Clarity

let check_literal input output =
  let lexbuf = Lexing.from_string input in
  let program = Clarity.literal Clarity.read_token lexbuf in
  let literal = Alcotest.testable Clarity.print_literal Clarity.equal_literal in
  Alcotest.(check literal) "" output program

let check_parse input output =
  let lexbuf = Lexing.from_string input in
  let program = Clarity.parse Clarity.read_token lexbuf in
  let parse = Alcotest.testable Sexp.print Sexp.equal in
  Alcotest.(check (list parse)) "" output program

let check_expression input output =
  let lexbuf = Lexing.from_string input in
  let program = Clarity.parse Clarity.read_token lexbuf in
  let expected = Clarity.parse_expression (List.hd program) in
  let expression = Alcotest.testable Clarity.print_expression Clarity.equal_expression in
  Alcotest.(check expression) "" output expected

let literal () =
  check_literal "none" (NoneLiteral);
  check_literal "false" (BoolLiteral false);
  check_literal "true" (BoolLiteral true);
  check_literal "42" (int_literal 42);
  check_literal "u42" (uint_literal 42);
  check_literal "0xabcd" (BuffLiteral "\xab\xcd");
  check_literal "0xABCD" (BuffLiteral "\xab\xcd");
  check_literal {|"Hello"|} (StringLiteral "Hello");
  check_literal {|"\t\r\n"|} (StringLiteral "\t\r\n");
  check_literal "{ id: 1337 }" (TupleLiteral [("id", int_literal 1337)]);
  check_literal "{ name: \"blockstack\" }" (TupleLiteral [("name", StringLiteral "blockstack")]);
  check_literal "{v1: 100, v2: 7}" (TupleLiteral [("v1", int_literal 100); ("v2", int_literal 7)])

let parses () =
  let open Sexp in
  check_parse "" [];
  check_parse "()"  [List []];
  check_parse "(foobar)"  [List [Sym "foobar"]];
  check_parse "(42)"  [List [Lit (int_literal 42)]];
  check_parse "(1 2)" [List [Lit (int_literal 1); Lit (int_literal 2)]];
  check_parse "((42))"  [List [List [Lit (int_literal 42)]]];
  check_parse "(tuple (name \"blockstack\") (id 1337))"
    [List [
      Sym "tuple";
      List [Sym "name"; Lit (StringLiteral "blockstack")];
      List [Sym "id"; Lit (int_literal 1337)]]]

let expressions () =
  check_expression "(let ((x 42)) x)"
    (Let ([("x", Literal (int_literal 42))], [Identifier "x"]));
  check_expression "(match x y y z z)"
    (Match (Identifier "x", ("y", Identifier "y"), ("z", Identifier "z")));
  check_expression "(tuple (name \"blockstack\") (id 1337))"
    (TupleExpression [
      ("name", Literal (StringLiteral "blockstack"));
      ("id", Literal (int_literal 1337))])

let () =
  Alcotest.run "Clarity" [
    "parse", [
      "literal", `Quick, literal;
      "parses", `Quick, parses;
      "expressions", `Quick, expressions;
    ];
  ]
