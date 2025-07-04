(* 
Une fonction est dite récursive terminale (ou tail-recursive en anglais) si l’appel 
récursif est la toute dernière chose que fait la fonction.

Concrètement :
Il n’y a plus d’opération après l’appel récursif.
Le compilateur peut alors remplacer l’appel récursif par une simple boucle → pas de consommation de pile supplémentaire
*)

(* 
  Voici un exemple simple non optimisé.
  Ici, le + x est fait après le retour de somme xs → pas terminale.
*)
let rec somme liste =
  match liste with
  | [] -> 0
  | x :: xs -> x + somme xs   (* addition après le retour de l'appel *)

(*  
  Voici l'exemple optimisé. 

  Ici :
    aux rappelle aux (acc + x) xs
    L’appel est en dernière position → récursivité terminale
    Le compilateur OCaml va optimiser cela en boucle → aucun risque de stack overflow, même pour des listes très longues.
*)
let somme liste =
  let rec aux acc liste =
    match liste with
    | [] -> acc
    | x :: xs -> aux (acc + x) xs
  in
  aux 0 liste

(* 
👉 En OCaml (et en général en FP), on utilise beaucoup la récursion au lieu des boucles for / while.
✅ Si on écrit les fonctions récursives en récursivité terminale, elles sont aussi efficaces qu’une boucle en C ou Java.
🚫 Si on ne le fait pas → risque de Stack overflow sur de grosses structures.
*)