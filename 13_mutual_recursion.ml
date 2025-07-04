(*
👉 Ici, plusieurs fonctions s’appellent mutuellement.
→ La fonction A appelle la fonction B, et la fonction B appelle la fonction A.

let rec f1 x = ... f2 ...    (* f1 appelle f2 *)
and f2 y = ... f1 ...        (* f2 appelle f1 *)

👉 La récursion mutuelle est utile quand tu as :
plusieurs "états" ou "rôles" qui se passent la main
plusieurs types de nœuds dans une grammaire
analyse de structures alternantes
Exemples :
  Pair / impair (exemple simple)
  Lecture de grammaires (parseurs)
  Machines à états
*)
let rec est_pair n =
  if n = 0 then true
  else est_impair (n - 1)

and est_impair n =
  if n = 0 then false
  else est_pair (n - 1);;

print_endline (string_of_bool (est_pair 6));;