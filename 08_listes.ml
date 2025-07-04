(* 
Une liste est une suite d’éléments du même type 
[1; 2; 3; 4]
*)

let l1 = [1; 2; 3; 4];;            (* int list *)
let l2 = ["a"; "b"; "c"];;         (* string list *)
let l3 = [true; false; true];;     (* bool list *)

(* 
vide : []
non vide : tête :: reste

[1; 2; 3]   ≡   1 :: (2 :: (3 :: []))
*)

let l = 1 :: 2 :: 3 :: [];;

(* ajout d'un élément *)
let l = 0 :: [1;2;3];;    (* l = [0;1;2;3] *)

(* concaténation *)
let l1 = [1;2];;
let l2 = [3;4];;
let l3 = l1 @ l2;;     (* l3 = [1;2;3;4] *)

(* Fonctions utiles *)
List.map (fun x -> x * 2) [1;2;3];;
(* Résultat : [2;4;6] *)

List.filter (fun x -> x mod 2 = 0) [1;2;3;4;5];;
(* Résultat : [2;4] *)

(* 
Fold est une fonction qui parcourt une liste et accumule un résultat.
(((init + x1) + x2) + x3) + x4 ...
*)
List.fold_left (fun acc x -> acc + x) 0 [1;2;3;4];;
(* Résultat : 10 *)

List.fold_left (fun acc x -> acc ^ x) "" ["a"; "b"; "c"];;
(* Résultat : "abc" *)

(* Utilisation du pattern matching avec les listes *)
let rec sum lst =
    match lst with
    | [] -> 0
    | h :: t -> h + sum t

let numbers = [2; 8; 4; 5; 9];;
let result = sum numbers;;
Printf.printf "Sum: %d\n" result;;

(*
On peut utiliser des fonctions anonymes pour les trier
*)
let result = List.map(fun x -> 2 * x)[1;2;3];;
List.iter (fun x -> print_int x; print_string " ") result;;
print_newline ();;