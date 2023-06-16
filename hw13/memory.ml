type t = (Env.addr * Value.t) list

let empty : t = []

let add (addr' : Env.addr) (va : Value.t) (memory : t) : t =
    let filter_memory = List.filter (fun (x, _) -> x <> addr') memory in [(addr', va)] @ filter_memory

let rec find (addr' : Env.addr) (memory : t) : Value.t =
    match memory with
    | (addr'', va)::other -> if addr'' = addr' then va else find addr' other
    | [] -> failwith ("[Error] Free address: " ^ (string_of_int addr'))