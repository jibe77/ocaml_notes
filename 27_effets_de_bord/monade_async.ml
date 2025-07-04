(*
Les monades asynchrones permettent de gérer des opérations qui prennent du temps 
(comme lire un fichier, faire une requête réseau...) sans bloquer le programme. 
En OCaml, cela se fait avec des monades qui représentent une "valeur future".

Une monade asynchrone est une sorte de promesse :
“Je n’ai pas encore la valeur, mais quand je l’aurai, je ferai quelque chose avec.”
*)

(* une computation asynchrone qui renverra un 'a plus tard 

type 'a Lwt.t
*)

(*
2. Fonctions monadiques
Lwt.return : crée une promesse résolue immédiatement
Lwt.bind (ou let* avec Lwt) : chaîne deux promesses
Lwt_main.run : exécute le programme et attend le résultat
*)

open Lwt.Infix  (* active let* et >>= *)

let somme_async x y =
  let%lwt a = Lwt.return x in
  let%lwt b = Lwt.return y in
  Lwt.return (a + b)

let () =
  let result = Lwt_main.run (somme_async 3 4) in
  Printf.printf "Résultat : %d\n" result

  (*
  🔄 Ce qu’il se passe réellement :
      Lwt.return x = crée une tâche qui renvoie x immédiatement
      let%lwt a = ... attend la fin de la tâche, puis extrait la valeur
      Le reste du calcul continue quand les résultats sont disponibles
      Lwt_main.run démarre la boucle et attend la fin du dernier calcul
  *)

  (* 
    compilation : 
    % ocamlfind ocamlopt -linkpkg -package lwt.unix,lwt_ppx -o monade_async monade_async.ml
  *)