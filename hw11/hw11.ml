open Ast
open Store

let rec interp (expr : Ast.expr) (store : Store.t) : Store.value = 
    let ast2add n1 n2 = NumV(n1 + n2) in
    let ast2sub n1 n2 = NumV(n1 - n2) in
    match expr with
    | Num n -> NumV n
    | Id var -> Store.find var store
    | Add (e1, e2) ->
        let x = interp e1 store in
        let y = interp e2 store in
        begin
            match x, y with
            | NumV n1, NumV n2 -> ast2add n1 n2
            | _, _ -> failwith (Format.asprintf "[Error] Not a number: %a + %a" Ast.pp e1 Ast.pp e2)
        end    
    | Sub (e1, e2) ->
        let x = interp e1 store in
        let y = interp e2 store in
        begin
            match x, y with
            | NumV n1, NumV n2 -> ast2sub n1 n2
            | _, _ -> failwith (Format.asprintf "[Error] Not a number: %a - %a" Ast.pp e1 Ast.pp e2)
        end
    | LetIn (x, e1, e2) -> let mid = Store.add x (interp e1 store) store in interp e2 mid
    | App (e1, e2) ->
        let clo_var = interp e1 store in
        let v1 = interp e2 store in (* 아마 여기서...*)
        begin
            match clo_var with
            | ClosureV(para, e3, map_mem) -> interp e3 (Store.add para v1 map_mem)
            | _ -> failwith (Format.asprintf "[Error] Not a function: %a" Ast.pp e1)
        end
    | Lambda (para, expr) -> ClosureV (para, expr, store)
    | LessThan(expr1, expr2) ->
        let x = interp expr1 store in
        let y = interp expr2 store in
        begin
            match x, y with
            | NumV x, NumV y -> if x < y then interp Ast.true_encoding store else interp Ast.false_encoding store
            | _, _ -> failwith (Format.asprintf "[Error] Not a number: %a < %a" Ast.pp expr1 Ast.pp expr2)
        end