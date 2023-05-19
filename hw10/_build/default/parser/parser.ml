
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | RIGHT_PARENTHESIS
    | PLUS
    | NUMBER of (
# 4 "parser/parser.mly"
       (int)
# 17 "parser/parser.ml"
  )
    | NEG
    | MINUS
    | LEFT_PARENTHESIS
    | KW_LET
    | KW_IN
    | KW_FUN
    | ID of (
# 5 "parser/parser.mly"
       (string)
# 28 "parser/parser.ml"
  )
    | EQ
    | EOF
    | ARROW
  
end

include MenhirBasics

# 1 "parser/parser.mly"
  
  open Ast

# 42 "parser/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_parse) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: parse. *)

  | MenhirState02 : (('s, _menhir_box_parse) _menhir_cell1_NEG, _menhir_box_parse) _menhir_state
    (** State 02.
        Stack shape : NEG.
        Start symbol: parse. *)

  | MenhirState03 : ((('s, _menhir_box_parse) _menhir_cell1_NEG, _menhir_box_parse) _menhir_cell1_LEFT_PARENTHESIS, _menhir_box_parse) _menhir_state
    (** State 03.
        Stack shape : NEG LEFT_PARENTHESIS.
        Start symbol: parse. *)

  | MenhirState04 : (('s, _menhir_box_parse) _menhir_cell1_LEFT_PARENTHESIS, _menhir_box_parse) _menhir_state
    (** State 04.
        Stack shape : LEFT_PARENTHESIS.
        Start symbol: parse. *)

  | MenhirState06 : (('s, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_state
    (** State 06.
        Stack shape : KW_LET ID.
        Start symbol: parse. *)

  | MenhirState07 : (('s, _menhir_box_parse) _menhir_cell1_ID, _menhir_box_parse) _menhir_state
    (** State 07.
        Stack shape : ID.
        Start symbol: parse. *)

  | MenhirState09 : ((('s, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_EQ, _menhir_box_parse) _menhir_state
    (** State 09.
        Stack shape : KW_LET ID EQ.
        Start symbol: parse. *)

  | MenhirState12 : (((('s, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_EQ, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_state
    (** State 12.
        Stack shape : KW_LET ID EQ expr.
        Start symbol: parse. *)

  | MenhirState13 : ((('s, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_PLUS, _menhir_box_parse) _menhir_state
    (** State 13.
        Stack shape : expr PLUS.
        Start symbol: parse. *)

  | MenhirState14 : (((('s, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_PLUS, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_state
    (** State 14.
        Stack shape : expr PLUS expr.
        Start symbol: parse. *)

  | MenhirState15 : ((('s, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_state
    (** State 15.
        Stack shape : expr expr.
        Start symbol: parse. *)

  | MenhirState16 : ((('s, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_MINUS, _menhir_box_parse) _menhir_state
    (** State 16.
        Stack shape : expr MINUS.
        Start symbol: parse. *)

  | MenhirState17 : (((('s, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_MINUS, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_state
    (** State 17.
        Stack shape : expr MINUS expr.
        Start symbol: parse. *)

  | MenhirState18 : ((((('s, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_EQ, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_KW_IN, _menhir_box_parse) _menhir_state
    (** State 18.
        Stack shape : KW_LET ID EQ expr KW_IN.
        Start symbol: parse. *)

  | MenhirState19 : (((((('s, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_EQ, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_KW_IN, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_state
    (** State 19.
        Stack shape : KW_LET ID EQ expr KW_IN expr.
        Start symbol: parse. *)

  | MenhirState21 : ((('s, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_var_list, _menhir_box_parse) _menhir_state
    (** State 21.
        Stack shape : KW_LET ID var_list.
        Start symbol: parse. *)

  | MenhirState22 : (((('s, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_var_list, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_state
    (** State 22.
        Stack shape : KW_LET ID var_list expr.
        Start symbol: parse. *)

  | MenhirState23 : ((((('s, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_var_list, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_KW_IN, _menhir_box_parse) _menhir_state
    (** State 23.
        Stack shape : KW_LET ID var_list expr KW_IN.
        Start symbol: parse. *)

  | MenhirState24 : (((((('s, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_var_list, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_KW_IN, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_state
    (** State 24.
        Stack shape : KW_LET ID var_list expr KW_IN expr.
        Start symbol: parse. *)

  | MenhirState25 : ((('s, _menhir_box_parse) _menhir_cell1_LEFT_PARENTHESIS, _menhir_box_parse) _menhir_cell1_KW_FUN, _menhir_box_parse) _menhir_state
    (** State 25.
        Stack shape : LEFT_PARENTHESIS KW_FUN.
        Start symbol: parse. *)

  | MenhirState27 : (((('s, _menhir_box_parse) _menhir_cell1_LEFT_PARENTHESIS, _menhir_box_parse) _menhir_cell1_KW_FUN, _menhir_box_parse) _menhir_cell1_var_list, _menhir_box_parse) _menhir_state
    (** State 27.
        Stack shape : LEFT_PARENTHESIS KW_FUN var_list.
        Start symbol: parse. *)

  | MenhirState28 : ((((('s, _menhir_box_parse) _menhir_cell1_LEFT_PARENTHESIS, _menhir_box_parse) _menhir_cell1_KW_FUN, _menhir_box_parse) _menhir_cell1_var_list, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_state
    (** State 28.
        Stack shape : LEFT_PARENTHESIS KW_FUN var_list expr.
        Start symbol: parse. *)

  | MenhirState30 : ((('s, _menhir_box_parse) _menhir_cell1_LEFT_PARENTHESIS, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_state
    (** State 30.
        Stack shape : LEFT_PARENTHESIS expr.
        Start symbol: parse. *)

  | MenhirState34 : (('s, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_state
    (** State 34.
        Stack shape : expr.
        Start symbol: parse. *)


and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Ast.expr)

and ('s, 'r) _menhir_cell1_var_list = 
  | MenhirCell1_var_list of 's * ('s, 'r) _menhir_state * (string list)

and ('s, 'r) _menhir_cell1_EQ = 
  | MenhirCell1_EQ of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 5 "parser/parser.mly"
       (string)
# 179 "parser/parser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 5 "parser/parser.mly"
       (string)
# 186 "parser/parser.ml"
)

and ('s, 'r) _menhir_cell1_KW_FUN = 
  | MenhirCell1_KW_FUN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_KW_IN = 
  | MenhirCell1_KW_IN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_KW_LET = 
  | MenhirCell1_KW_LET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LEFT_PARENTHESIS = 
  | MenhirCell1_LEFT_PARENTHESIS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MINUS = 
  | MenhirCell1_MINUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NEG = 
  | MenhirCell1_NEG of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PLUS = 
  | MenhirCell1_PLUS of 's * ('s, 'r) _menhir_state

and _menhir_box_parse = 
  | MenhirBox_parse of (Ast.expr) [@@unboxed]

let _menhir_action_01 =
  fun e1 e2 x ->
    (
# 24 "parser/parser.mly"
                                                      ( LetIn (x, e1, e2) )
# 218 "parser/parser.ml"
     : (Ast.expr))

let _menhir_action_02 =
  fun e1 e2 ->
    (
# 25 "parser/parser.mly"
                               ( App (e1, e2) )
# 226 "parser/parser.ml"
     : (Ast.expr))

let _menhir_action_03 =
  fun e1 e2 x xlst ->
    (
# 26 "parser/parser.mly"
                                                                    ( 
      LetIn (x, List.fold_right (fun x e -> Lambda (x, e)) xlst e1, e2)
    )
# 236 "parser/parser.ml"
     : (Ast.expr))

let _menhir_action_04 =
  fun e xlst ->
    (
# 29 "parser/parser.mly"
                                                                         ( 
      List.fold_right (fun x e -> Lambda (x, e)) xlst e
    )
# 246 "parser/parser.ml"
     : (Ast.expr))

let _menhir_action_05 =
  fun x ->
    (
# 32 "parser/parser.mly"
         ( Id x )
# 254 "parser/parser.ml"
     : (Ast.expr))

let _menhir_action_06 =
  fun e1 e2 ->
    (
# 33 "parser/parser.mly"
                         ( Add (e1, e2) )
# 262 "parser/parser.ml"
     : (Ast.expr))

let _menhir_action_07 =
  fun e1 e2 ->
    (
# 34 "parser/parser.mly"
                          ( Sub (e1, e2) )
# 270 "parser/parser.ml"
     : (Ast.expr))

let _menhir_action_08 =
  fun n ->
    (
# 35 "parser/parser.mly"
             ( Num n )
# 278 "parser/parser.ml"
     : (Ast.expr))

let _menhir_action_09 =
  fun e ->
    (
# 36 "parser/parser.mly"
                     ( Sub (Num 0, e))
# 286 "parser/parser.ml"
     : (Ast.expr))

let _menhir_action_10 =
  fun e ->
    (
# 37 "parser/parser.mly"
                 ( e )
# 294 "parser/parser.ml"
     : (Ast.expr))

let _menhir_action_11 =
  fun e ->
    (
# 44 "parser/parser.mly"
                                              ( e )
# 302 "parser/parser.ml"
     : (Ast.expr))

let _menhir_action_12 =
  fun e ->
    (
# 21 "parser/parser.mly"
               ( e )
# 310 "parser/parser.ml"
     : (Ast.expr))

let _menhir_action_13 =
  fun x ->
    (
# 40 "parser/parser.mly"
         ( [x] )
# 318 "parser/parser.ml"
     : (string list))

let _menhir_action_14 =
  fun x xlst ->
    (
# 41 "parser/parser.mly"
                       ( x :: xlst )
# 326 "parser/parser.ml"
     : (string list))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ARROW ->
        "ARROW"
    | EOF ->
        "EOF"
    | EQ ->
        "EQ"
    | ID _ ->
        "ID"
    | KW_FUN ->
        "KW_FUN"
    | KW_IN ->
        "KW_IN"
    | KW_LET ->
        "KW_LET"
    | LEFT_PARENTHESIS ->
        "LEFT_PARENTHESIS"
    | MINUS ->
        "MINUS"
    | NEG ->
        "NEG"
    | NUMBER _ ->
        "NUMBER"
    | PLUS ->
        "PLUS"
    | RIGHT_PARENTHESIS ->
        "RIGHT_PARENTHESIS"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_34 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parse) _menhir_state -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | NUMBER _v_0 ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v_0 in
          let _v = _menhir_action_08 n in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NEG ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | LEFT_PARENTHESIS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | KW_LET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | ID _v_2 ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v_2 in
          let _v = _menhir_action_05 x in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | EOF ->
          let e = _v in
          let _v = _menhir_action_12 e in
          MenhirBox_parse _v
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. ((ttv_stack, _menhir_box_parse) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_parse) _menhir_state -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PLUS (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUMBER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_08 n in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
      | NEG ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | LEFT_PARENTHESIS ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | KW_LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_05 x in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. (((ttv_stack, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_PLUS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parse) _menhir_state -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | NEG ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | EOF | ID _ | KW_IN | KW_LET | LEFT_PARENTHESIS | MINUS | NUMBER _ | PLUS | RIGHT_PARENTHESIS ->
          let MenhirCell1_PLUS (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_06 e1 e2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_parse) _menhir_state -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NEG (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LEFT_PARENTHESIS ->
          let _menhir_stack = MenhirCell1_LEFT_PARENTHESIS (_menhir_stack, MenhirState02) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUMBER _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v in
              let _v = _menhir_action_08 n in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
          | NEG ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
          | LEFT_PARENTHESIS ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
          | KW_LET ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
          | ID _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v in
              let _v = _menhir_action_05 x in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ((ttv_stack, _menhir_box_parse) _menhir_cell1_LEFT_PARENTHESIS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parse) _menhir_state -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHT_PARENTHESIS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LEFT_PARENTHESIS (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_11 e in
          _menhir_goto_paren_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | NUMBER _v_0 ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v_0 in
          let _v = _menhir_action_08 n in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NEG ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | LEFT_PARENTHESIS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | KW_LET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | ID _v_2 ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v_2 in
          let _v = _menhir_action_05 x in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_paren_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parse) _menhir_state -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState02 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState34 ->
          _menhir_run_11_spec_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_11_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState03 ->
          _menhir_run_11_spec_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState30 ->
          _menhir_run_11_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState04 ->
          _menhir_run_11_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState28 ->
          _menhir_run_11_spec_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState27 ->
          _menhir_run_11_spec_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState22 ->
          _menhir_run_11_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState24 ->
          _menhir_run_11_spec_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState23 ->
          _menhir_run_11_spec_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState21 ->
          _menhir_run_11_spec_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState12 ->
          _menhir_run_11_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState19 ->
          _menhir_run_11_spec_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState18 ->
          _menhir_run_11_spec_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState17 ->
          _menhir_run_11_spec_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState16 ->
          _menhir_run_11_spec_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState15 ->
          _menhir_run_11_spec_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState14 ->
          _menhir_run_11_spec_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState13 ->
          _menhir_run_11_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState09 ->
          _menhir_run_11_spec_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_32 : type  ttv_stack. (ttv_stack, _menhir_box_parse) _menhir_cell1_NEG -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NEG (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_09 e in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parse) _menhir_state -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState03 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState04 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState27 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState23 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState21 ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState18 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState34 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState30 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState28 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState22 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState24 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState12 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState19 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState17 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState15 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState14 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState13 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_28 : type  ttv_stack. ((((ttv_stack, _menhir_box_parse) _menhir_cell1_LEFT_PARENTHESIS, _menhir_box_parse) _menhir_cell1_KW_FUN, _menhir_box_parse) _menhir_cell1_var_list as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parse) _menhir_state -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHT_PARENTHESIS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_var_list (_menhir_stack, _, xlst) = _menhir_stack in
          let MenhirCell1_KW_FUN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LEFT_PARENTHESIS (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_04 e xlst in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | NUMBER _v_0 ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v_0 in
          let _v = _menhir_action_08 n in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NEG ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | LEFT_PARENTHESIS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | KW_LET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | ID _v_2 ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v_2 in
          let _v = _menhir_action_05 x in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_parse) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_02 e1 e2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_16 : type  ttv_stack. ((ttv_stack, _menhir_box_parse) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_parse) _menhir_state -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUMBER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_08 n in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
      | NEG ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | LEFT_PARENTHESIS ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | KW_LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_05 x in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. (((ttv_stack, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_MINUS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parse) _menhir_state -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | NEG ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | EOF | ID _ | KW_IN | KW_LET | LEFT_PARENTHESIS | MINUS | NUMBER _ | PLUS | RIGHT_PARENTHESIS ->
          let MenhirCell1_MINUS (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_07 e1 e2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_parse) _menhir_state -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LEFT_PARENTHESIS (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUMBER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_08 n in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
      | NEG ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | LEFT_PARENTHESIS ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | KW_LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | KW_FUN ->
          let _menhir_stack = MenhirCell1_KW_FUN (_menhir_stack, MenhirState04) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25
          | _ ->
              _eRR ())
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_05 x in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_parse) _menhir_state -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_KW_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v_0 ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState06
          | EQ ->
              let _menhir_stack = MenhirCell1_EQ (_menhir_stack, MenhirState06) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | NUMBER _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v_1 in
                  let _v = _menhir_action_08 n in
                  _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
              | NEG ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
              | LEFT_PARENTHESIS ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
              | KW_LET ->
                  _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
              | ID _v_3 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v_3 in
                  let _v = _menhir_action_05 x in
                  _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parse) _menhir_state -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState07
      | ARROW | EQ ->
          let x = _v in
          let _v = _menhir_action_13 x in
          _menhir_goto_var_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_var_list : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parse) _menhir_state -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState25 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState06 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_26 : type  ttv_stack. (((ttv_stack, _menhir_box_parse) _menhir_cell1_LEFT_PARENTHESIS, _menhir_box_parse) _menhir_cell1_KW_FUN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parse) _menhir_state -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_var_list (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ARROW ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUMBER _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_0 in
              let _v = _menhir_action_08 n in
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
          | NEG ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | LEFT_PARENTHESIS ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | KW_LET ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_05 x in
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. ((ttv_stack, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parse) _menhir_state -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_var_list (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUMBER _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_0 in
              let _v = _menhir_action_08 n in
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState21 _tok
          | NEG ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
          | LEFT_PARENTHESIS ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
          | KW_LET ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_05 x in
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState21 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. (((ttv_stack, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_var_list as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parse) _menhir_state -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | NUMBER _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v_0 in
          let _v = _menhir_action_08 n in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NEG ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | MINUS ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | LEFT_PARENTHESIS ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | KW_LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | KW_IN ->
          let _menhir_stack = MenhirCell1_KW_IN (_menhir_stack, MenhirState22) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUMBER _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_2 in
              let _v = _menhir_action_08 n in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
          | NEG ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
          | LEFT_PARENTHESIS ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
          | KW_LET ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
          | ID _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_4 in
              let _v = _menhir_action_05 x in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
          | _ ->
              _eRR ())
      | ID _v_6 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v_6 in
          let _v = _menhir_action_05 x in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. (((((ttv_stack, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_var_list, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_KW_IN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parse) _menhir_state -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | NEG ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | KW_LET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | EOF | ID _ | KW_IN | LEFT_PARENTHESIS | NUMBER _ | RIGHT_PARENTHESIS ->
          let MenhirCell1_KW_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_var_list (_menhir_stack, _, xlst) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_KW_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_03 e1 e2 x xlst in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. (ttv_stack, _menhir_box_parse) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xlst = _v in
      let _v = _menhir_action_14 x xlst in
      _menhir_goto_var_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_12 : type  ttv_stack. (((ttv_stack, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_EQ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parse) _menhir_state -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
      | NUMBER _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v_0 in
          let _v = _menhir_action_08 n in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NEG ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
      | MINUS ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
      | LEFT_PARENTHESIS ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
      | KW_LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
      | KW_IN ->
          let _menhir_stack = MenhirCell1_KW_IN (_menhir_stack, MenhirState12) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUMBER _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_2 in
              let _v = _menhir_action_08 n in
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState18 _tok
          | NEG ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
          | LEFT_PARENTHESIS ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
          | KW_LET ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
          | ID _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_4 in
              let _v = _menhir_action_05 x in
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState18 _tok
          | _ ->
              _eRR ())
      | ID _v_6 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v_6 in
          let _v = _menhir_action_05 x in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. (((((ttv_stack, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_EQ, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_KW_IN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parse) _menhir_state -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | NEG ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | KW_LET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | EOF | ID _ | KW_IN | LEFT_PARENTHESIS | NUMBER _ | RIGHT_PARENTHESIS ->
          let MenhirCell1_KW_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_EQ (_menhir_stack, _) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_KW_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_01 e1 e2 x in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_11_spec_34 : type  ttv_stack. (ttv_stack, _menhir_box_parse) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_11_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
  
  and _menhir_run_11_spec_03 : type  ttv_stack. ((ttv_stack, _menhir_box_parse) _menhir_cell1_NEG, _menhir_box_parse) _menhir_cell1_LEFT_PARENTHESIS -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
  
  and _menhir_run_11_spec_30 : type  ttv_stack. ((ttv_stack, _menhir_box_parse) _menhir_cell1_LEFT_PARENTHESIS, _menhir_box_parse) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_11_spec_04 : type  ttv_stack. (ttv_stack, _menhir_box_parse) _menhir_cell1_LEFT_PARENTHESIS -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
  
  and _menhir_run_11_spec_28 : type  ttv_stack. ((((ttv_stack, _menhir_box_parse) _menhir_cell1_LEFT_PARENTHESIS, _menhir_box_parse) _menhir_cell1_KW_FUN, _menhir_box_parse) _menhir_cell1_var_list, _menhir_box_parse) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_11_spec_27 : type  ttv_stack. (((ttv_stack, _menhir_box_parse) _menhir_cell1_LEFT_PARENTHESIS, _menhir_box_parse) _menhir_cell1_KW_FUN, _menhir_box_parse) _menhir_cell1_var_list -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
  
  and _menhir_run_11_spec_22 : type  ttv_stack. (((ttv_stack, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_var_list, _menhir_box_parse) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_11_spec_24 : type  ttv_stack. (((((ttv_stack, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_var_list, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_KW_IN, _menhir_box_parse) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_11_spec_23 : type  ttv_stack. ((((ttv_stack, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_var_list, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_KW_IN -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
  
  and _menhir_run_11_spec_21 : type  ttv_stack. ((ttv_stack, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_var_list -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState21 _tok
  
  and _menhir_run_11_spec_12 : type  ttv_stack. (((ttv_stack, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_EQ, _menhir_box_parse) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_11_spec_19 : type  ttv_stack. (((((ttv_stack, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_EQ, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_KW_IN, _menhir_box_parse) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_11_spec_18 : type  ttv_stack. ((((ttv_stack, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_EQ, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_KW_IN -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState18 _tok
  
  and _menhir_run_11_spec_17 : type  ttv_stack. (((ttv_stack, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_MINUS, _menhir_box_parse) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_11_spec_16 : type  ttv_stack. ((ttv_stack, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
  
  and _menhir_run_11_spec_15 : type  ttv_stack. ((ttv_stack, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_11_spec_14 : type  ttv_stack. (((ttv_stack, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_PLUS, _menhir_box_parse) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_11_spec_13 : type  ttv_stack. ((ttv_stack, _menhir_box_parse) _menhir_cell1_expr, _menhir_box_parse) _menhir_cell1_PLUS -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
  
  and _menhir_run_11_spec_09 : type  ttv_stack. ((ttv_stack, _menhir_box_parse) _menhir_cell1_KW_LET _menhir_cell0_ID, _menhir_box_parse) _menhir_cell1_EQ -> _ -> _ -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_10 e in
      _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_parse =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUMBER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_08 n in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | NEG ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LEFT_PARENTHESIS ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | KW_LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_05 x in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | _ ->
          _eRR ()
  
end

let parse =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_parse v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
