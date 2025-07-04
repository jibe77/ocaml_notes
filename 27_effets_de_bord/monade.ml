(*
Les monades sont un modèle de programmation pour gérer proprement des effets 
comme l'état, les erreurs, l'I/O, etc., sans quitter le monde fonctionnel pur.

Une monade, c’est essentiellement un type avec deux fonctions fondamentales.
*)

(*
module type MONADE = sig
  type 'a t                  (* le type enveloppé *)

  val return : 'a -> 'a t    (* injecte une valeur dans la monade *)
  val bind : 'a t -> ('a -> 'b t) -> 'b t  (* permet de chaîner les opérations *)
end
*)

(* Définition d'une monade Option avec let* *)

module OptionMonad = struct
  let return x = Some x

  let ( let* ) opt f =
    match opt with
    | Some x -> f x
    | None -> None
end

open OptionMonad

(* Fonction de division sécurisée *)
let division a b =
  if b = 0 then None else Some (a / b)

(* Fonction monadique *)
let calcul_monadique x y z =
  let* a = division x y in
  let* b = division a z in
  return (b + 1)

(* Fonction d'affichage du résultat *)
let afficher_resultat opt =
  match opt with
  | Some v -> Printf.printf "Résultat : %d\n" v
  | None -> print_endline "Erreur : division par zéro"

(* Exécutions *)
let () =
  print_endline "Test 1 : calcul_monadique 12 3 2";
  afficher_resultat (calcul_monadique 12 3 2);

  print_endline "Test 2 : calcul_monadique 12 0 2";
  afficher_resultat (calcul_monadique 12 0 2)
