(* 
  Si tu veux "modifier" une valeur, tu ne la changes pas : tu crées une NOUVELLE valeur. 
  En OCaml, tout est immuable par défaut.
  👉 Sécurité :
  Si une valeur ne change pas, ton programme est plus prévisible → moins de bugs.
  👉 Simplicité :
  Moins besoin de penser à "qui a changé quoi".
  👉 Parallélisme :
  Pas besoin de synchroniser des variables quand on fait du code concurrent.

  En OCaml, si tu veux ce comportement, tu dois le faire explicitement avec ref :
*)

let x = ref 5;;
x := 10;;
Printf.printf "%d\n" !x;;

(* En OCaml, les listes sont aussi immuables : *)

let l1 = [1; 2; 3];;

let l2 = 0 :: l1 ;;   (* l2 = [0; 1; 2; 3] *)

(* 
  l1 n'a PAS changé ! l1 est toujours [1; 2; 3] 
  👉 Quand tu "ajoutes" un élément, tu crées une nouvelle liste.
  L’ancienne liste n’est pas modifiée.
*)

 

(* arbres, ensembles immuables *)