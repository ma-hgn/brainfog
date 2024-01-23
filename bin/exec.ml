open Ast
open Tape
open Helpers

let run program tape =
  let program = Array.of_list program in
  let rec loop i =
    if i < Array.length program
    then (
      match program.(i) with
      | Up when tape.ptr - 1 < 0 -> failwith "Tried to move past beginning of tape."
      | Up ->
        tape.ptr <- tape.ptr - 1;
        loop (i + 1)
      | Down when tape.ptr + 1 >= Array.length tape.data ->
        failwith "Tried to move past end of tape."
      | Down ->
        tape.ptr <- tape.ptr + 1;
        loop (i + 1)
      | Five ->
        tape.data.(tape.ptr) <- (tape.data.(tape.ptr) + 5) mod 7;
        loop (i + 1)
      | Write ->
        let a = tape.data.(tape.ptr) in
        tape.ptr <- tape.ptr + 1;
        let b = tape.data.(tape.ptr) in
        tape.ptr <- tape.ptr + 1;
        let c = tape.data.(tape.ptr) in
        tape.ptr <- tape.ptr + 1;
        print_char (char_of_int (base7_to_base10 (a, b, c)));
        loop (i + 1)
      | Read ->
        (* TODO: read input character-wise without pressing enter (perhaps in raw mode) *)
        let c =
          try Some (input_char stdin) with
          | End_of_file -> None
        in
        let a, b, c =
          match c with
          | Some ch -> base10_to_base7 (Char.code ch)
          | None -> base10_to_base7 (Char.code '\n')
        in
        tape.data.(tape.ptr) <- a;
        tape.ptr <- tape.ptr + 1;
        tape.data.(tape.ptr) <- b;
        tape.ptr <- tape.ptr + 1;
        tape.data.(tape.ptr) <- c;
        tape.ptr <- tape.ptr + 1;
        loop (i + 1)
      | Start ->
        if tape.data.(tape.ptr) = 6
        then loop (find_loop_end program (i + 1) + 1)
        else loop (i + 1)
      | End ->
        if tape.data.(tape.ptr) <> 6
        then loop (find_loop_start program (i - 1) + 1)
        else loop (i + 1))
  in
  let () = loop 0 in
  tape
;;
