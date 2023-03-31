type state = | Q0 | Q1 | Q2 | Q3 | Q4 | Q5

let transfer (st : state) (c : char) = 
    match st, c with
    | Q0, '0'..'9' -> Q1
    | Q1, '0'..'9'
    | Q2, '0'..'9'
    | Q3, '0'..'9'
    | Q4, '0'..'9'
    | Q5, '0'..'9' -> Q1
    | Q1, '+' -> Q2
    | Q1, '-' -> Q3
    | Q1, '*' -> Q4
    | Q1, '/' -> Q5
    | _, _ -> failwith "rejected"

let lex (str : string) = 
    let str2char_lst = List.of_seq((String.to_seq str)) in
        let rec lex' str2char_lst st =
        match str2char_lst with
        | [] -> st
        | fst::other -> transfer (lex' other st) fst
        in
        if (lex' str2char_lst Q0) = Q1 then true else failwith "rejected"

let tokenize (str : string) : string list = 
        let char_lst = List.of_seq((String.to_seq str)) in
            let rec tokenize' char_lst state str str_lst = 
            match char_lst, state with
            | [], Q0 | [], Q2 | [], Q3 | [], Q4 | [], Q5 -> failwith "rejected"
            | [], Q1 -> str_lst @ [str]
            | fst::other, Q0 -> (tokenize' other (transfer state fst) (String.make 1 fst) str_lst)
            | fst::other, _ ->
            if (transfer state fst) = state
            then tokenize' other (transfer state fst) (str ^ (String.make 1 fst)) str_lst 
            else tokenize' other (transfer state fst) (String.make 1 fst) (str_lst @ [str])
            in
            tokenize' char_lst Q0 "" []

let lex_to_expr _  = failwith "not implemented"