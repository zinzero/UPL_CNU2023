module F = Format

type expr = Num of int
  | Id of string
  | Add of expr * expr
  | Sub of expr * expr
  | LetIn of string * expr * expr
  | App of expr * expr
  | Lambda of string * expr
  | LessThan of expr * expr

let true_encoding : expr = Lambda ("x", Lambda ("y", Id "x"))

let false_encoding : expr = Lambda ("x", Lambda ("y", Id "y"))

let rec pp fmt e = 
  match e with
  | Num n -> F.fprintf fmt "%d" n
  | Id x -> F.fprintf fmt "%s" x
  | Add (e1, e2) -> F.fprintf fmt "%a + %a" pp e1 pp e2
  | Sub (e1, e2) -> F.fprintf fmt "%a - %a" pp e1 pp e2
  | LetIn (x, e1, e2) -> F.fprintf fmt "let %s = %a in %a" x pp e1 pp e2
  | App (e1, e2) -> F.fprintf fmt "%a %a" pp e1 pp e2
  | Lambda (x, e) -> F.fprintf fmt "(fun %s -> %a)" x pp e
  | LessThan (e1, e2) -> F.fprintf fmt "%a < %a" pp e1 pp e2

let rec pp_ast fmt e = 
  match e with
  | Num n -> F.fprintf fmt "(Num %d)" n
  | Id x -> F.fprintf fmt "(Id %s)" x
  | Add (e1, e2) -> F.fprintf fmt "(Add (%a, %a))" pp_ast e1 pp_ast e2
  | Sub (e1, e2) -> F.fprintf fmt "(Sub (%a, %a))" pp_ast e1 pp_ast e2
  | LetIn (x, e1, e2) -> F.fprintf fmt "(LetIn (%s, %a, %a))" x pp_ast e1 pp_ast e2
  | App (e1, e2) -> F.fprintf fmt "(App (%a, %a))" pp_ast e1 pp_ast e2
  | Lambda (x, e) -> F.fprintf fmt "(Lambda (%s, %a))" x pp_ast e
  | LessThan (e1, e2) -> F.fprintf fmt "(LessThan (%a, %a))" pp_ast e1 pp_ast e2
