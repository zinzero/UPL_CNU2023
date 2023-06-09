{
  open Parser

  exception LexingError of string
}

(* Decimal number *)
let pos_digit = ['1'-'9']
let digit = ['0'-'9']
let pos_number = pos_digit digit*
let number = "0" | pos_number | '-' pos_number

(* Identifier *)
let id = ['a'-'z'] ['a'-'z''A'-'Z''_''\'']*

(* White space *)
let ws = [' ''\t''\n']*

rule read = 
  parse
  | "let" { KW_LET }
  | "in" { KW_IN }
  | "rec" { KW_REC }
  | "fun" { KW_FUN }
  | "if" { KW_IF }
  | "then" { KW_THEN }
  | "else" { KW_ELSE }
  | "true" { TRUE }
  | "false" { FALSE }
  | "+" { PLUS }
  | "-" { MINUS }
  | "(" { LEFT_PARENTHESIS }
  | ")" { RIGHT_PARENTHESIS }
  | "=" { EQ }
  | "->" { ARROW }
  | "<" { LESSTHAN }
  | "~" { NEG }
  | number as n { NUMBER (int_of_string n) }
  | id as i { ID i }
  | ws { read lexbuf }
  | eof { EOF }
  | _ { raise (LexingError ("Unexpected character: " ^ Lexing.lexeme lexbuf)) }


