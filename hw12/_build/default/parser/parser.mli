
(* The type of tokens. *)

type token = 
  | TRUE
  | RIGHT_PARENTHESIS
  | PLUS
  | NUMBER of (int)
  | NEG
  | MINUS
  | LESSTHAN
  | LEFT_PARENTHESIS
  | KW_THEN
  | KW_REC
  | KW_LET
  | KW_IN
  | KW_IF
  | KW_FUN
  | KW_ELSE
  | ID of (string)
  | FALSE
  | EQ
  | EOF
  | ARROW

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val parse: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr)
