open Ast
open Store

let rec interp (ast : Ast.expr) (store : Store.t) : Store.value =
    let ast2add n1 n2 =
    match n1, n2 with
    | NumV n1, NumV n2 -> NumV(n1 + n2) in
    let ast2sub n1 n2 =
    match n1, n2 with
    | NumV n1, NumV n2 -> NumV(n1 - n2) in
    match ast with
    | Num num -> NumV num
    | Id str -> find str store
    | Add (e1, e2) -> ast2add (interp e1 store) (interp e2 store)
    | Sub (e1, e2) -> ast2sub (interp e1 store) (interp e2 store)
    | LetIn (x, e1, e2) -> 
    let temp = Store.add x (interp e1 store) store in interp e2 temp
