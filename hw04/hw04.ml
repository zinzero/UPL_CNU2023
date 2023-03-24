type op = 
  | ADD
  | SUB
  | MUL
  | DIV

type value = 
  | Err
  | Int of int
  | Float of float

type expr = 
  | E of op * expr * expr
  | V of value


let rec eval (e : expr) = 
  match e with
  | V v-> v
  | E (op, n1, n2) -> 
    | ADD ->
      begin
        match n1, n2 with
        | Int i1, Int i2 ->