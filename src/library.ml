(* This is free and unencumbered software released into the public domain. *)

(* See: https://github.com/weavery/clarity.js#supported-clarity-features *)

let is_primitive = function
  | "*" | "mul" -> true
  | "+" | "add" -> true
  | "-" | "sub" -> true
  | "/" | "div" -> true
  | "<" | "lt" -> true
  | "<=" | "le" -> true
  | ">" | "gt" -> true
  | ">=" | "ge" -> true
  | "append" -> true
  | "as-contract" -> true
  | "as-max-len?" -> true
  | "at-block" -> true
  | "block-height" -> true
  | "concat" -> true
  | "contract-call?" -> true
  | "contract-caller" -> true
  | "contract-of" -> true
  | "default-to" -> true
  | "err" -> true
  | "filter" -> true
  | "fold" -> true
  | "ft-get-balance" -> true
  | "ft-mint?" -> true
  | "ft-transfer?" -> true
  | "get" -> true
  | "get-block-info?" -> true
  | "hash160" -> true
  | "is-eq" -> true
  | "is-err" -> true
  | "is-none" -> true
  | "is-ok" -> true
  | "is-some" -> true
  | "keccak256" -> true
  | "len" -> true
  | "list" -> true
  | "map" -> true
  | "map-delete" -> true
  | "map-get?" -> true
  | "map-insert" -> true
  | "map-set" -> true
  | "mod" -> true
  | "nft-get-owner?" -> true
  | "nft-mint?" -> true
  | "nft-transfer?" -> true
  | "none" -> true
  | "not" -> true
  | "ok" -> true
  | "pow" -> true
  | "print" -> true
  | "sha256" -> true
  | "sha512" -> true
  | "sha512/256" -> true
  | "some" -> true
  | "to-int" -> true
  | "to-uint" -> true
  | "try!" -> true
  | "tuple" -> true
  | "tx-sender" -> true
  | "unwrap!" -> true
  | "unwrap-err!" -> true
  | "unwrap-err-panic" -> true
  | "unwrap-panic" -> true
  | "xor" -> true
  | _ -> false
