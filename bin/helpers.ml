open Ast

let find_loop_end program start =
  let rec go i depth =
    match program.(i) with
    | Start -> go (i + 1) (depth + 1)
    | End when depth = 1 -> i
    | End -> go (i + 1) (depth - 1)
    | _ -> go (i + 1) depth
  in
  go start 1
;;

let find_loop_start program end_ =
  let rec go i depth =
    match program.(i) with
    | End -> go (i - 1) (depth + 1)
    | Start when depth = 1 -> i
    | Start -> go (i - 1) (depth - 1)
    | _ -> go (i - 1) depth
  in
  go end_ 1
;;

let base10_to_base7 n =
  let rec go n acc = if n = 0 then acc else go (n / 7) ((n mod 7) :: acc) in
  match go n [] with
  | [ a; b; c ] -> a, b, c
  | [ a; b ] -> 0, a, b
  | [ a ] -> 0, 0, a
  | _ -> 0, 0, 0
;;

let base7_to_base10 (a, b, c) = (a * 49) + (b * 7) + c
