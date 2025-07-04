(*
Les effets de bord se réfèrent à toute modification de l'état du programme ou de son environnement 
qui n’est pas directement liée à la valeur de retour d'une fonction.

Ces effets de bord sont ce qui perturbe la pureté fonctionnelle du langage.

Exemples d'effets de bord : 
*)

let x = ref 10

let increment () =
  x := !x + 1

(*
Les opérations comme lire ou écrire dans des fichiers, afficher des messages à l'écran :
*)

let print_message () =
  print_endline "Hello, world!"  (* Affiche quelque chose à l'écran *)

(* 
Modification de structures de données mutables :
*)

let my_list = ref [1; 2; 3]

let add_to_list v =
  my_list := v :: !my_list  (* Modifie la liste mutable *)

(* Exceptions *)
let divide x y =
  if y = 0 then raise (Failure "Division par zéro") else x / y

(*
Pourquoi les effets de bord sont-ils à éviter en OCaml ?
OCaml, étant un langage fonctionnel, valorise les fonctions pures. Une fonction pure a plusieurs avantages :
Prédictibilité : Elle ne dépend que de ses arguments et son comportement est entièrement déterminé par ceux-ci.
Testabilité : On peut facilement tester une fonction pure sans se soucier de l'état global du programme.
Composabilité : Les fonctions pures peuvent être combinées et réutilisées de manière transparente.
Les effets de bord compliquent la raison de comprendre, tester et maintenir un programme, en particulier dans un contexte concurrentiel ou asynchrone.
*)