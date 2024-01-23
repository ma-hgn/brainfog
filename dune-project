(lang dune 3.12)

(name brainfog)

(generate_opam_files true)

(source
 (github ma-hgn/brainfog))

(authors "Mark Hagen")

(license GPL-3.0-or-later)

(package
 (name brainfog)
 (synopsis "An interpreter for the brainfog language.")
 (description "An interpreter for brainfog, an esoteric programming language like brainfuck, but even more atrocious to write code in.")
 (depends ocaml dune)
 (tags
  (interpreter brainfuck esolang "esoteric programming language")))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
