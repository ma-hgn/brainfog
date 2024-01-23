type tape =
  { data : int array
  ; mutable ptr : int
  }

let init_tape size = { data = Array.make size 0; ptr = 0 }

let print_tape tape =
  for i = 1 to Array.length tape.data do
    match i with
    | i when i mod 3 == 0 -> Printf.printf "%d " tape.data.(i - 1)
    | i -> Printf.printf "%d" tape.data.(i - 1)
  done;
  Printf.printf "\n"
;;
