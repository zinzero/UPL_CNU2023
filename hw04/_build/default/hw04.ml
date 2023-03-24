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

(* let rec eval (e : expr) =
   let add (expr1 : expr) (expr2 : expr) =
    match expr1, expr2 with
    | Int i1, Int i2 -> Int (i1 + i2)
    | Float f1, Float f2 -> Float (f1 +. f2)
    | Int i, Float f
    | Float f, Int i -> Float ((float_of_int i) +. f)
  in
  let sub (expr1 : expr) (expr2 : expr) =
    match expr1, expr2 with
          | Int i1, Int i2 -> Int (i1 - i2)
          | Float f1, Float f2 -> Float (f1 -. f2)
          | Int i, Float f
          | Float f, Int i -> Float ((float_of_int i) -. f)
  in
  let mul (expr1 : expr) (expr2 : expr) =
    match expr1, expr2 with
          (* | value v, Err -> Err *)
          | Int i1, Int i2 -> Int (i1 * i2)
          | Float f1, Float f2 -> Float (f1 *. f2)
          | Int i, Float f
          | Float f, Int i -> Float ((float_of_int i) *. f)
  in
  let div (expr1 : expr) (expr2 : expr) =
    match n1, n2 with
          (* | value v, Err -> Err *)
          | Int i1, Int i2 -> Int (i1 / i2)
          | Float f1, Float f2 -> Float (f1 /. f2)
          | Int i, Float f
          | Float f, Int i -> Float ((float_of_int i) /. f) *)
          
let rec eval (e : expr) = 
  match e with
  | V v-> v
  | E (op, n1, n2) -> 
    begin
      match op with
      | ADD -> 
        begin
          match n1, n2 with
          | V v1, V v2 ->
            begin
              match v1, v2 with
              | Int i1, Int i2 -> Int (i1 + i2)
              | Float f1, Float f2 -> Float (f1 +. f2)
              | Int i, Float f
              | Float f, Int i -> Float ((float_of_int i) +. f)
              | _, _ -> Err
            end
          | _, _ -> Err
        end
      | SUB ->
        begin
          match n1, n2 with
          | V v1, V v2 ->
            begin
              match v1, v2 with
              | Int i1, Int i2 -> Int (i1 - i2)
              | Float f1, Float f2 -> Float (f1 -. f2)
              | Int i, Float f
              | Float f, Int i -> Float ((float_of_int i) -. f)
              | _, _ -> Err
            end
          | _, _ -> Err
          end
      | MUL ->
        begin
          match n1, n2 with
          | V v1, V v2 ->
            begin
              match v1, v2 with
              | Int i1, Int i2 -> Int (i1 * i2)
              | Float f1, Float f2 -> Float (f1 *. f2)
              | Int i, Float f
              | Float f, Int i -> Float ((float_of_int i) *. f)
              | _, _ -> Err
            end
          | _, _ -> Err
          end
      | DIV ->
        begin
          match n1, n2 with
          | V v1, V v2 ->
            begin
              match n1, n2 with
              | Int i1, Int i2 -> Int (i1 / i2)
              | Float f1, Float f2 -> Float (f1 /. f2)
              | Int i, Float f
              | Float f, Int i -> Float ((float_of_int i) /. f)
              | _, _ -> Err
            end
          | _, _ -> Err
        end
    end

