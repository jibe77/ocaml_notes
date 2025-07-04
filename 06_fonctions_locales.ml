(* Cas 1 : sans fonction locale (tout en global) *)
let est_pair n = n mod 2 = 0;;

print_endline (string_of_bool (est_pair 6));;

let somme_des_pairs liste =
  List.fold_left (fun acc x -> if est_pair x then acc + x else acc) 0 liste;;

print_int (somme_des_pairs [1;2;3;4;5;6]);;
print_newline ();;

(* Cas 2 : avec fonction locale (plus propre) 
    Ici est_pair est une fonction locale → elle ne sert qu’à l’intérieur de somme_des_pairs. *)
let somme_des_pairs_locale liste =
  let est_pair n = n mod 2 = 0 in
  List.fold_left (fun acc x -> if est_pair x then acc + x else acc) 0 liste;;

print_int (somme_des_pairs_locale [1;2;3;4;5;6]);;
print_newline ();;