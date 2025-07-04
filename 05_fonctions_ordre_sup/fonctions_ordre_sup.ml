(* C’est simplement :
👉 une fonction qui :
1️⃣ prend une autre fonction en paramètre
et/ou
2️⃣ retourne une fonction en résultat.
👉 C’est un concept clé en programmation fonctionnelle (comme en OCaml).*)

(* 
  ✅ Ici f est une fonction
  ✅ x est la valeur de départ
*)
let appliquer_deux_fois f x =
  f (f x);;

let incrementer n = n + 1;;

let resultat = appliquer_deux_fois incrementer 3;;

print_int resultat;;  (* Résultat : 5 *)

(* Une fonction qui retourne une fonction *)
(* On remarque le mot-clé fun en OCaml sert à définir une fonction anonyme — c’est-à-dire une fonction sans nom. *)
let creer_multiplicateur facteur =
  fun x -> facteur * x;;

let doubler = creer_multiplicateur 2;;
let tripler = creer_multiplicateur 3;;

print_int (doubler 5);;  (* Résultat : 10 *)
print_int (tripler 4);;  (* Résultat : 12 *)

(*
Parmi les particularité du langage, on peut faire de la composition de fonctions
*)

let (<<) f g x = f (g x)
let add_one x = x + 1;;
let double x = x * 2;;
let add_one_then_double = double << add_one;;
let result = add_one_then_double 3;; (* returns 8 *)
print_int (result);; 

(* 
exemple avec la fonction fold_left
*)
let result = List.fold_left (/) 64 [4;2;4];;
print_int result;;
