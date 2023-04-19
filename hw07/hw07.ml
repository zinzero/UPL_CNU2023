open Value

let rec interp (ast : Ast.expr) : Value.t =
    let ast2add n1 n2 =
    match n1, n2 with
    | NumV n1, NumV n2 -> NumV(n1 + n2)
    in
    let ast2sub n1 n2 =
    match n1, n2 with
    | NumV n1, NumV n2 -> NumV(n1 - n2)
    in
    
    match ast with
    | Num nv -> NumV nv
    | Add (e1, e2) -> ast2add (interp e1) (interp e2)
    | Sub (e1, e2) -> ast2sub (interp e1) (interp e2)




