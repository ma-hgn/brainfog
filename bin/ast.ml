type command =
  | Up
  | Down
  | Five
  | Write
  | Read
  | Start
  | End

let parse_program program =
  let rec go i acc =
    if i >= String.length program
    then List.rev acc
    else (
      let cmd =
        match program.[i] with
        | '^' -> Some Up
        | 'v' -> Some Down
        | '5' -> Some Five
        | ':' -> Some Write
        | ';' -> Some Read
        | '{' -> Some Start
        | '}' -> Some End
        | _ -> None
      in
      match cmd with
      | Some c -> go (i + 1) (c :: acc)
      | None -> go (i + 1) acc)
  in
  go 0 []
;;
