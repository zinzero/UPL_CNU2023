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
  | V v -> v
  | E (op, n1, n2) ->
    begin
        match op with 
        | ADD ->
            begin 
                match (eval n1), (eval n2) with
                | Int i1, Int i2 -> Int (i1 + i2)
                | Float f1, Float f2 -> Float (f1 +. f2)
                | Int i, Float f -> Float ((float_of_int i) +. f)
                | Float f, Int i -> Float (f +. (float_of_int i))
                | _, Err -> Err
                | Err, _  -> Err
            end    
        | SUB ->
            begin
                match (eval n1), (eval n2) with
                | Int i1, Int i2 -> Int (i1 - i2)
                | Float f1, Float f2 -> Float (f1 -. f2)
                | Int i, Float f -> Float ((float_of_int i) -. f)
                | Float f, Int i -> Float (f  -. (float_of_int i))
                | _, Err -> Err
                | Err, _ -> Err
            end
        | MUL ->
            begin
                match (eval n1), (eval n2) with
                | Int i1, Int i2 -> Int (i1 * i2)
                | Float f1, Float f2 -> Float (f1 *. f2)
                | Int i, Float f
                | Float f, Int i -> Float ((float_of_int i) *. f)
                | _, Err -> Err
                | Err, _ -> Err
            end
        | DIV ->
            begin
                match (eval n1), (eval n2) with
                | _, Int 0 -> Err
                | _, Float 0.0 -> Err
                | Int i1, Int i2 -> Int (i1 / i2)
                | Float f1, Float f2 -> Float (f1 /. f2)
                | Int i, Float f -> Float ((float_of_int i) /. f)
                | Float f, Int i -> Float (f /. (float_of_int i))
                | _, Err -> Err
                | Err, _ -> Err
            end
    end
