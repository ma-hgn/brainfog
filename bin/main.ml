open Args
open Exec
open Tape
open Ast

let () =
  let args = parse_args (Array.to_list Sys.argv) in
  let channel = open_in args.filename in
  let program = really_input_string channel (in_channel_length channel) in
  let tape = init_tape args.tape_size in
  let commands = parse_program program in
  let tape = run commands tape in
  if args.print_tape
  then (
    print_string "\n";
    print_tape tape)
;;
