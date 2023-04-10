type token = 
    | TL of string 
    | TO of string

let to_token (str : string list) : token list = 
    let rec to_token' (str : string list) (token_lst : token list) =
    match str with
    | fst::other ->
        begin
            match Stdlib.int_of_string_opt fst with
            | None -> to_token' other (token_lst @ [TO fst]) 
            | Some i -> to_token' other (token_lst @ [TL (string_of_int i)])
        end
    | [] -> token_lst
    in to_token' str []

let to_postfix (token_lst : token list) : token list =
    let postfix_stack = Stack.create () in 
    let lst_head = List.hd token_lst in Stack.push lst_head postfix_stack;
    let lst_tail = List.tl token_lst in
        let rec to_postfix' lst_tail =
        match lst_tail with
        | TO fst::other -> Stack.push (TO fst) postfix_stack; to_postfix' other
        | TL fst::other -> 
            let temp = Stack.pop postfix_stack in
            Stack.push (TL fst) postfix_stack;
            Stack.push temp postfix_stack;
            to_postfix' other
        | [] -> postfix_stack
        in List.rev (List.of_seq (Stack.to_seq (to_postfix' lst_tail)))

type op = ADD | SUB | MUL | DIV
type value = Int of int | Float of float | Err
type expr =  E of op * expr * expr | V of value

let parse (token_lst : token list) : expr =
    let parse_stack = Stack.create () in
        let rec parse' token_lst' =
        match token_lst' with
        | TL fst::other -> Stack.push (V (Int (int_of_string fst))) parse_stack; parse' other
        | TO "+"::other -> 
            let temp1 = Stack.pop parse_stack in
            let temp2 = Stack.pop parse_stack in
            Stack.push (E (ADD, temp2, temp1)) parse_stack;
            parse' other
        | TO "-"::other -> 
            let temp1 = Stack.pop parse_stack in
            let temp2 = Stack.pop parse_stack in
            Stack.push (E (SUB, temp2, temp1)) parse_stack;
            parse' other
        | TO "*"::other -> 
            let temp1 = Stack.pop parse_stack in
            let temp2 = Stack.pop parse_stack in
            Stack.push (E (MUL, temp2, temp1)) parse_stack;
            parse' other
        | TO "/"::other -> 
            let temp1 = Stack.pop parse_stack in
            let temp2 = Stack.pop parse_stack in
            Stack.push (E (DIV, temp2, temp1)) parse_stack;
            parse' other
        | [] -> Stack.pop parse_stack
        | _ -> failwith "rejected"
        in parse' token_lst