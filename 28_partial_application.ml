(*
une partial application (ou application partielle) est une manière de fournir 
seulement une partie des arguments d'une fonction, pour obtenir une nouvelle 
fonction qui attend les arguments restants.

Si tu as une fonction qui prend plusieurs arguments, tu peux l'appeler avec 
seulement quelques-uns de ces arguments. OCaml te renvoie alors une fonction 
partiellement appliquée, prête à recevoir les arguments manquants.
*)

(*

Ici :
add 5 est une partial application.
add5 est une fonction équivalente à fun y -> 5 + y.

*)

let add x y = x + y
let add5 = add 5
let result = add5 3  (* result = 8 *)

(*
en OCaml, les fonctions sont curried par défaut
*)

let add x y = ...

(*
est en réalité interprété comme :
*)

let add = fun x -> (fun y -> x + y)

(* Autre exemple concret *)
let greet name message = Printf.printf "%s, %s!\n" message name
let greet_bob = greet "Bob"
greet_bob "Hello"  (* Affiche : Hello, Bob! *)

(*
Utilité :
  -> Créer des fonctions spécialisées à partir de fonctions générales.
  -> Faciliter la composition fonctionnelle.
  -> Rendre ton code plus lisible et réutilisable
*)