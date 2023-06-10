open Ast

let rec interp_expr (expr : Ast.expr) ((env, mem) : Env.t * Memory.t) : Value.t = 
    let ast2add n1 n2 = NumV(n1 + n2) in
    let ast2sub n1 n2 = NumV(n1 - n2) in
    match expr with
    | Num n -> NumV n
    | Ref ref -> Env.find ref env
    | Id x ->
        begin
            match Store.find x mem with
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
            | _, _ -> failwith (Format.asprintf "[Error] Not a number: %a + %a" Ast.pp e1 Ast.pp e2)
        end
    | Sub (e1, e2) ->
        let x = interp_expr e1 (env, mem) in
        let y = interp_expr e2 (env, mem) in
        begin
            match x, y with
            | NumV n1, NumV n2 -> ast2sub n1 n2
            | _, _ -> failwith (Format.asprintf "[Error] Not a number: %a - %a" Ast.pp e1 Ast.pp e2)
        end
    | Lt (e1, e2) ->
        let x = interp_expr e1 (env, mem) in
        let y = interp_expr e2 (env, mem) in
        begin
            match x, y with
            | NumV n1, NumV n2 -> if n1 < n2 then BoolV (true) else BoolV (false)
            | _, _ -> failwith (Format.asprintf "[Error] Not a number: %a < %a" Ast.pp e1 Ast.pp e2)
        end
    | Gt (e1, e2) ->
        let x = interp_expr e1 (env, mem) in
        let y = interp_expr e2 (env, mem) in
        begin
            match x, y with
            | NumV n1, NumV n2 -> if n1 > n2 then BoolV (true) else BoolV (false)
            | _, _ -> failwith (Format.asprintf "[Error] Not a number: %a > %a" Ast.pp e1 Ast.pp e2)
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
            | _, _ -> failwith (Format.asprintf "[Error] Not a boolean: %a && %a" Ast.pp e1 Ast.pp e2)
        end
    | Or (e1, e2) ->
        let x = interp_expr e1 (env, mem) in
        let y = interp_expr e2 (env, mem) in
        begin
            match x, y with
            | BoolV b1, BoolV b2 -> BoolV(b1 || b2)
            | _, _ -> failwith (Format.asprintf "[Error] Not a boolean: %a || %a" Ast.pp e1 Ast.pp e2)
        end

let rec interp_stmt (stmt : Ast.stmt) ((env, mem) : Env.t * Memory.t) : Env.t * Memory.t =
    let rec stmtlst stmt_lst (env_lst, mem_lst) =
        match stmt_lst with
        | fs::other -> let (env', mem') = interp_stmt fs (env_lst, mem_lst) in stmtlst other (env', mem')
        | [] -> (env_lst, mem_lst) in
    match stmt with
    | DefStmt (def) -> 
        let newaddr = AddrManager.new_addr () in ((Env.add def newaddr env), (Memory.add def newaddr env))
    | StoreStmt (e1, e2) ->
        let addr = interp_expr e1 (env, mem) in
        let result = interp_expr e2 (env, mem) in
        begin
            match addr with
            | AddrV addr' -> (env, (Memory.add result addr' env))
            | _ -> failwith (Format.asprintf "[Error] Not a address: %a" Ast.pp addr)
        end
    | LoadStmt (va, e) ->
        let result = interp_expr e (env, mem) in
        let addr = Env.find va env in
        begin
            match addr with
            | AddrV addr' -> (env, (Memory.add addr' (Memory.find addr' mem) mem))
            | _ -> failwith (Format.asprintf "[Error] Not a address: %a" Ast.pp ex_addr)
        end
    | IfStmt (e, stlst1, stlst2) ->
        let bool = interp_expr e (env, mem) in
        begin
            match bool with
            | BoolV b -> 
                if b then let (_, rmem) = stmtlst stlst1 (env, mem) in (env, rmem)
                    else let (_, rmem) = stmtlst stlst2 (env, mem) in (env, rmem)
            | _ -> failwith (Format.asprintf "[Error] Not a boolean: %a" Ast.pp bool)
        end
    | LoopStmt (e, stlst) ->
        let bool = interp_expr e (env, mem) in
        begin
            match bool with
            | BoolV b ->
                if b then let (_, rmem) = stmtlst stlst (env, mem) in let (_, rrmem) = interp_stmt stlst (env, rmem) in (env, rrmem)
                    else (env, mem)
            | _ -> failwith (Format.asprintf "[Error] Not a boolean: %a" Ast.pp bool)
        end

let rec interp_prog (Program (prog) : Ast.prog) : Env.t * Memory.t =
    let _ = AddrManager.init () in
    let rec stmtlst stmt_lst (env, mem) =
        match stmt_lst with
        | fs::other -> let (env', mem') = interp_stmt fs (env, mem) in stmtlst other (env', mem')
        | [] -> (env, mem)
    in stmtlst prog ([], [])