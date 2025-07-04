(* 
Le pattern matching permet de décomposer des valeurs selon leur structure et de faire des 
actions en fonction de la forme de la donnée.

👉 C’est comme un super if ... else, mais :
✅ plus lisible
✅ plus sûr
✅ plus puissant, car il fonctionne avec des structures complexes (listes, tuples, variants...).

match valeur with
| pattern1 -> action1
| pattern2 -> action2
| ... 

*)
let x = 3;;

match x with
| 1 -> print_endline "Un"
| 2 -> print_endline "Deux"
| 3 -> print_endline "Trois"
| _ -> print_endline "Autre"

let day = "lundi";;

match day with
| "lundi" -> print_endline "Début de semaine"
| "mardi" -> print_endline "Deuxième jour"
| "samedi" | "dimanche" -> print_endline "Week-end !"
| _ -> print_endline "Jour de semaine normal";;

let l = [1;2;3];;

match l with
| [] -> print_endline "Liste vide"
| x :: xs -> Printf.printf "Tête = %d\n" x
