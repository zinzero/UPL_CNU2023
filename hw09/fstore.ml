type t = (string * (string list * Ast.expr)) list

let empty : t = []

let rec find (fname : string) (fstore : t) : string list * Ast.expr =
    match fstore with
    | (f, (vars, ast))::other -> if f = fname then (vars, ast) else find fname other
    | [] -> failwith ("[Error Unbound function: " ^ fname)

let add (fname : string) (vars : string list) (ast : Ast.expr) (fstore : t) : t =
    let filter_store = List.filter (fun (x, (_, _)) -> x <> fname) fstore in [(fname, (vars, ast))] @ filter_store

