(* main.ml *)

(* On ouvre le module pour l'utiliser *)
open Implementation

let () =
  Printf.printf "carre de 5 = %d\n" (carre 5);
  Printf.printf "double de 7 = %d\n" (double 7);

  let c = Rouge in
  match c with
  | Rouge -> print_endline "Rouge"
  | Vert -> print_endline "Vert"
  | Bleu -> print_endline "Bleu"

(* 
  L'utilisation se base sur la compilation : 

  ocamlc -c implementation.mli
  ocamlc -c implementation.ml
  ocamlc -c main.ml
  ocamlc -o programme implementation.cmo main.cmo
  
  Puis exécution : 

  ./programme

*)