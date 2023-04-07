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
    let token_stack = Stack.create () in
        let rec to_postfix' token_lst result_lst token_stack =
        match token_lst with
        | fst::other -> Stack.push fst token_stack; to_postfix' other (result_lst @ List.of_seq(Stack.to_seq(Stack.top token_stack))) token_stack
        | [] -> result_lst
        in to_postfix' token_lst [] token_stack

type op = ADD | SUB | MUL | DIV
type value = Int of int | Float of float | Err
type expr = E of op * expr * expr | V of value

let parse (token_lst : token list) : expr =
    let postfix_lst = to_postfix token_lst in
        let rec parse' postfix_lst = 
        match postfix_lst with
        | fst
        | [] -> failwith "rejected"