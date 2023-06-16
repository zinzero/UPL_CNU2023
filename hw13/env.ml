type addr = int
type t = (string * addr) list

let empty : t = []

let add (va : string) (addr' : addr) (env : t) : t =
    let filter_env = List.filter (fun (x, _) -> x <> va) env in [(va, addr')] @ filter_env

let rec find (va : string) (env : t) : addr =
    match env with
    | (va', addr')::other -> if va' = va then addr' else find va other
    | [] -> failwith ("[Error] Free identifier: " ^ va)