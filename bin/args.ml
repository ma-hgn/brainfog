type args =
  { mutable filename : string
  ; mutable print_tape : bool
  ; mutable tape_size : int
  }

let parse_args argv =
  let defaults = { filename = ""; print_tape = false; tape_size = 999 } in
  let rec go argv args =
    match argv with
    | [] -> args
    | "--tape-size" :: size :: argv ->
      args.tape_size <- int_of_string size;
      go argv args
    | "--print-tape" :: argv ->
      args.print_tape <- true;
      go argv args
    | arg :: argv ->
      if String.starts_with ~prefix:"-" arg
      then (
        Printf.printf "Unrecognized argument: '%s'\n" arg;
        exit 1)
      else args.filename <- arg;
      go argv args
  in
  go argv defaults
;;
