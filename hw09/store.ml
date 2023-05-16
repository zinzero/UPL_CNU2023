type value = NumV of int
type t = (string * value) list

let empty : t = []

let rec find (str : string) (store : t) : value = 
    match store with
    | (st, va)::other -> if st = str then va else find str other
    | [] -> failwith ("[Error] Free identifier: " ^ str)

let add (str : string) (va : value) (store : t) : t =
    let filter_store = List.filter (fun (x,_) -> x <> str) store in [(str, va)] @ filter_store

