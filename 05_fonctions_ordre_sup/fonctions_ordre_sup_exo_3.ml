(*
Implémenter une fonction qui retourne le produit des éléments d'une liste.
Cette fois on utilise uniquement les éléments impaires, sinon on les ignore.

On va utiliser l'opérateur pipe |> afin d'enchainer les fonctions.
*)

let prod lst =
  List.fold_left ( * ) 1 lst 

let prodEvens lst = 
  let is_even x = x mod 2 = 0 in
  lst 
  |> List.filter is_even
  |> prod 

let result = prodEvens [2;4;7;9;10];;
Printf.printf "The product is: %d.\n" result;;
