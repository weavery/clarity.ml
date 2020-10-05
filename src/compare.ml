(* This is free and unencumbered software released into the public domain. *)

let rec equal_expressions a b =
  List.length a = List.length b && List.for_all2 equal_expression a b

and equal_expression a b = match (a, b) with
  | Let (bindings1, body1), Let (bindings2, body2) ->
    equal_bindings bindings1 bindings2 && equal_expressions body1 body2
  | Literal a, Literal b -> equal_literal a b
  | Match (input1, (ok_name1, ok_expr1), (err_name1, err_expr1)),
    Match (input2, (ok_name2, ok_expr2), (err_name2, err_expr2)) ->
    ok_name1 = ok_name2 && err_name1 = err_name2 &&
    equal_expression input1 input2 &&
    equal_expression ok_expr1 ok_expr2 &&
    equal_expression err_expr1 err_expr2
  | TupleExpression a, TupleExpression b -> equal_bindings a b
  | a, b -> a = b

and equal_literal a b = match (a, b) with
  | IntLiteral a, IntLiteral b -> Integer.equal a b
  | UintLiteral a, UintLiteral b -> Integer.equal a b
  | TupleLiteral (ak, av), TupleLiteral (bk, bv) -> ak = bk && equal_literal av bv
  | a, b -> a = b

and equal_bindings a b =
  let equal_binding (ak, av) (bk, bv) = ak = bk && equal_expression av bv in
  List.length a = List.length b && List.for_all2 equal_binding a b
