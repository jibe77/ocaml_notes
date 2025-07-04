(*
Implémenter une fonction qui retourne le produit des éléments d'une liste.
*)

let myList = [1;2;3;4;5];;
let result = List.fold_left ( * ) 1 myList;;
Printf.printf "The product is %d.\n" result;;
