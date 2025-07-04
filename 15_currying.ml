(*
  Le currying est un concept fondamental en programmation fonctionnelle — et en OCaml, c’est automatique.

👉Le currying consiste à transformer une fonction qui prend plusieurs arguments en une 
  suite de fonctions qui prennent chacune un seul argument.
*)

(* Supposons qu’on ait une fonction pour additionner 2 nombres : *)
let addition x y = x + y

(* 
Cette fonction :
ne prend pas "vraiment" 2 arguments en même temps
Elle est en fait vue par OCaml comme :
*)

let addition = fun x -> (fun y -> x + y)

(* 👉 C’est une fonction qui prend x et renvoie une fonction qui prend y. *)

let add5 = addition 5    (* c'est une fonction : add5 y = 5 + y *)

let resultat = add5 3    (* 5 + 3 = 8 *)

print_int(resultat)

(*
✅ Réutiliser facilement des fonctions en fixant des arguments → on crée des fonctions plus spécialisées.
✅ Très utile avec les fonctions d’ordre supérieur.

En OCaml, le currying est automatique 

let f x y z = ...

Est automatiquement compris comme :

let f = fun x -> fun y -> fun z -> ...
*)
