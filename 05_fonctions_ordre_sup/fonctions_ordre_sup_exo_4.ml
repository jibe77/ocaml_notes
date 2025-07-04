(*
Implémenter une fonction powerOf2 qui génère une liste de k éléments à la puissance 2.

powersOf2 5 retourne 1 2 4 8 16
powersOf2 8 retourne 1 2 4 8 16 32 64 128
*)

(* 
Core est une réimplémentation complète de la Stdlib, avec :
des types plus sûrs (ex. : Option.t, Result.t),
des noms plus cohérents et prévisibles,
une organisation modulaire (par ex. Core.List, Core.String, Core.Map, etc.),
des structures de données plus puissantes (ex. : Hash_set, Core.Map paramétré avec des modules Key),
des fonctions bien typées avec moins de comportements implicites.

  % opam install core
*)
open Core

let powersOf2 k = 
  let rec generate_powers n count acc = 
    if count = k then List.rev acc
    else generate_powers (n*2) (count + 1) (n :: acc)
    in 
    generate_powers 1 0 []

let k = 5;;
let first_k_powers = powersOf2 k;;

(*

Cette dernière ligne va afficher à l’écran chaque puissance de 2 séparée par un espace.
List.iter
  C’est une fonction qui applique une fonction donnée à chaque élément d’une liste.
  Ici, c’est la version de List fournie par le module Core, donc on a des arguments nommés (notamment ~f:).

~f: (fun n -> Printf.printf "%d " n)
  Cela signifie : pour chaque élément n dans la liste, exécuter Printf.printf "%d " n.
  C’est-à-dire, afficher le nombre n suivi d’un espace, sans retour à la ligne.

first_k_powers
  C’est la liste générée juste avant, contenant les k premières puissances de 2.
  Exemple : si k = 5, alors first_k_powers = [1; 2; 4; 8; 16]

*)

List.iter ~f: (fun n -> Printf.printf "%d " n) first_k_powers;;

(*
    Il faut passer par la compilation pour charger le package core

    % ocamlfind ocamlc -o my_program -linkpkg -thread -package core fonctions_ordre_sup_exo_4.ml
    % ./my_program 
    1 2 4 8 16
*)