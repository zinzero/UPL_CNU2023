open Ast
open Store

let rec interp (expr : Ast.expr) (store : Store.t) : Store.value = 
    let ast2add n1 n2 = NumV(n1 + n2) in
    let ast2sub n1 n2 = NumV(n1 - n2) in
    (*let ast2app exp =
        match exp with
        | ClosureV(para, expr, store) -> let midddd = Store.add para  store in
        | _ -> failwith (Fomat.asprintf "[Error] Not a function: %a" Ast.pp exp) in*)
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
        let expr1 = interp e1 store in
        let v1 = interp e2 store in
        begin
            match expr1 with
            | ClosureV(para, e3, store1) ->  interp e3 (Store.add para v1 store1)
            | _ -> failwith (Format.asprintf "[Error] Not a function: %a" Ast.pp e1)
        end
    | Lambda (para, expr) -> ClosureV (para, expr, store)