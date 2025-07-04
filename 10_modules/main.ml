open Mon_module

let () =
  Printf.printf "carre 5 = %d\n" (carre 5);
  Printf.printf "double 7 = %d\n" (double 7);

  let c = Rouge in
  match c with
  | Rouge -> print_endline "Rouge"
  | Vert -> print_endline "Vert"
  | Bleu -> print_endline "Bleu"

  