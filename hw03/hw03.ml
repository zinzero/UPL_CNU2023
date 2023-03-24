let rec len lst = 
        match lst with
        | [] -> 0
        | _ :: t -> 1 + (len t)


let rec rev lst2 = 
        match lst2 with
        | [] -> []
        | fst::other -> (rev other) @ [fst]

let rec map func lst3 = 
        match lst3 with
        | [] -> []
        | fst::other -> [(func fst)] @ (map func other)

let rec fold_right func n lst4 =
        match lst4 with
        | [] -> n
        | fst::other -> func (fst, (fold_right func n other))

