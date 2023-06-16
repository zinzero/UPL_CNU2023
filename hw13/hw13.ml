open Ast
open Value

let rec interp_expr (expr : Ast.expr) ((env, mem) : Env.t * Memory.t) : Value.t = 
    let ast2add n1 n2 = NumV (n1 + n2) in
    let ast2sub n1 n2 = NumV (n1 - n2) in
    match expr with
    | Num n -> NumV n
    | Ref ref -> AddrV (Env.find ref env)
    | Id x ->
        let addr = Env.find x env in
        begin
            match Memory.find addr mem with
            | NumV v -> NumV v
            | BoolV b -> BoolV b
            | AddrV a -> AddrV a
        end
    | Bool bol -> BoolV bol
    | Add(e1, e2) ->
        let x = interp_expr e1 (env, mem) in
        let y = interp_expr e2 (env, mem) in
        begin
            match x, y with
            | NumV n1, NumV n2 -> ast2add n1 n2
            | _, _ -> failwith (Format.asprintf "[Error] Not a number: %a + %a" Ast.pp_expr e1 Ast.pp_expr e2)
        end
    | Sub (e1, e2) ->
        let x = interp_expr e1 (env, mem) in
        let y = interp_expr e2 (env, mem) in
        begin
            match x, y with
            | NumV n1, NumV n2 -> ast2sub n1 n2
            | _, _ -> failwith (Format.asprintf "[Error] Not a number: %a - %a" Ast.pp_expr e1 Ast.pp_expr e2)
        end
    | Lt (e1, e2) ->
        let x = interp_expr e1 (env, mem) in
        let y = interp_expr e2 (env, mem) in
        begin
            match x, y with
            | NumV n1, NumV n2 -> if n1 < n2 then BoolV (true) else BoolV (false)
            | _, _ -> failwith (Format.asprintf "[Error] Not a number: %a < %a" Ast.pp_expr e1 Ast.pp_expr e2)
        end
    | Gt (e1, e2) ->
        let x = interp_expr e1 (env, mem) in
        let y = interp_expr e2 (env, mem) in
        begin
            match x, y with
            | NumV n1, NumV n2 -> if n1 > n2 then BoolV (true) else BoolV (false)
            | _, _ -> failwith (Format.asprintf "[Error] Not a number: %a > %a" Ast.pp_expr e1 Ast.pp_expr e2)
        end
    | Eq (e1, e2) ->
        let x = interp_expr e1 (env, mem) in
        let y = interp_expr e2 (env, mem) in
        if x = y then BoolV (true) else BoolV (false)
    | And(e1, e2) ->
        let x = interp_expr e1 (env, mem) in
        let y = interp_expr e2 (env, mem) in
        begin
            match x, y with
            | BoolV b1, BoolV b2 -> BoolV(b1 && b2)
            | _, _ -> failwith (Format.asprintf "[Error] Not a boolean: %a && %a" Ast.pp_expr e1 Ast.pp_expr e2)
        end
    | Or (e1, e2) ->
        let x = interp_expr e1 (env, mem) in
        let y = interp_expr e2 (env, mem) in
        begin
            match x, y with
            | BoolV b1, BoolV b2 -> BoolV(b1 || b2)
            | _, _ -> failwith (Format.asprintf "[Error] Not a boolean: %a || %a" Ast.pp_expr e1 Ast.pp_expr e2)
        end

let rec interp_stmt (stmt : Ast.stmt) ((env, mem) : Env.t * Memory.t) : Env.t * Memory.t =
    let rec stmtlst stmt_lst (env_lst, mem_lst) =
        match stmt_lst with
        | fs::other -> let (env', mem') = interp_stmt fs (env_lst, mem_lst) in stmtlst other (env', mem')
        | [] -> (env_lst, mem_lst) in
    match stmt with
    | DefStmt (def) -> 
        let newaddr = AddrManager.new_addr () in ((Env.add def newaddr env), mem)
    | StoreStmt (e1, e2) ->
        let addr = interp_expr e1 (env, mem) in
        let result = interp_expr e2 (env, mem) in
        begin
            match addr with
            | AddrV addr' -> (env, (Memory.add addr' result mem))
            | _ -> failwith (Format.asprintf "[Error] Not a address: %a" Ast.pp_expr e1)
        end
    | LoadStmt (va, e) ->
        let x = Env.find va env in
        let addr = interp_expr e (env, mem) in
        begin
            match addr with
            | AddrV addr' -> let va' = Memory.find addr' mem in (env, (Memory.add x va' mem))
            (* (env, (Memory.add addr' (Env.find va env) mem)) *)
            | _ -> failwith (Format.asprintf "[Error] Not a address: %a" Ast.pp_expr e)
        end
    | IfStmt (e, stlst1, stlst2) ->
        let bool = interp_expr e (env, mem) in
        begin
            match bool with
            | BoolV b -> 
                if b then let (_, rmem) = stmtlst stlst1 (env, mem) in (env, rmem)
                    else let (_, rmem) = stmtlst stlst2 (env, mem) in (env, rmem)
            | _ -> failwith (Format.asprintf "[Error] Not a boolean: %a" Ast.pp_expr e)
        end
    | LoopStmt (e, stlst) ->
        let bool = interp_expr e (env, mem) in
        begin
            match bool with
            | BoolV b ->
                if b then let (_, rmem) = stmtlst stlst (env, mem) in 
                    let (_, rrmem) = stmtlst stlst (env, rmem) in (env, rrmem)
                    else (env, mem)
            | _ -> failwith (Format.asprintf "[Error] Not a boolean: %a" Ast.pp_expr e)
        end

let interp_prog (Program (prog) : Ast.prog) : Env.t * Memory.t =
    let _ = AddrManager.init () in
    let rec stmtlst stmt_lst (env, mem) =
        match stmt_lst with
        | fs::other -> let (env', mem') = interp_stmt fs (env, mem) in stmtlst other (env', mem')
        | [] -> (env, mem)
    in stmtlst prog ([], [])