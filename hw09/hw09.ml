open Ast
open Store

let interp_def (def : Ast.fundef) (fstore : Fstore.t) : Fstore.t =
    match def with
    | FunDef (fname, vars, expr) -> Fstore.add fname vars expr fstore

let rec interp_expr (expr : Ast.expr) (fstore : Fstore.t) (store : Store.t) : Store.value = 
    let ast2add n1 n2 =
        match n1, n2 with
        | NumV n1, NumV n2 -> NumV(n1 + n2) in
    let ast2sub n1 n2 =
        match n1, n2 with
        | NumV n1, NumV n2 -> NumV(n1 - n2) in
    let rec ast2call arg_lst expr_lst store =
        match arg_lst, expr_lst with
        | arghd::argother, exhd::exother ->
            let mid = Store.add arghd (interp_expr exhd fstore store) store in ast2call argother exother mid
        | _, _ -> store in
    match expr with
    | Num num -> NumV num
    | Id str -> Store.find str store
    | Add (e1, e2) -> ast2add (interp_expr e1 fstore store) (interp_expr e2 fstore store)
    | Sub (e1, e2) -> ast2sub (interp_expr e1 fstore store) (interp_expr e2 fstore store)
    | LetIn (x, e1, e2) -> let mid = Store.add x (interp_expr e1 fstore store) store in interp_expr e2 fstore mid
    | Call (fname, expr_lst) -> 
        let called_fun = Fstore.find fname fstore in
            match called_fun with
            | (arg_lst, body) -> 
                if (List.length arg_lst) = (List.length expr_lst) 
                then let mid_store = ast2call arg_lst expr_lst [] in interp_expr body fstore mid_store
                else failwith ("[Error] Unmatched the number of arguments")

let interp_prog (prog : Ast.prog) : Store.value =
    let rec def_fstore def_lst fstore =
        match def_lst with
        | [] -> fstore
        | fst::other -> let ongoing = interp_def fst fstore in def_fstore other ongoing in
    match prog with
    | Prog (fundef, expr) -> let prog_fstore = def_fstore fundef [] in interp_expr expr prog_fstore []