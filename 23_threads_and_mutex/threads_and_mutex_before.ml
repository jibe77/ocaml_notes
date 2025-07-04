(*
  % ocamlfind ocamlopt -thread -package threads -linkpkg -o threads_and_mutex_before threads_and_mutex_before.ml
*)

open Thread
let counter = ref 0

let () =
  Printf.printf "Thread principal: Démarrage du test avec race condition.\n%!";

  (* Création des threads, les assignant à des variables *)
  let t1 = Thread.create (fun () ->
      for _ = 1 to 1_000_000 do
        incr counter
      done
    ) () in

  let t2 = Thread.create (fun () ->
      for _ = 1 to 1_000_000 do
        incr counter
      done
    ) () in

  (* Attendre la fin des threads pour voir le résultat *)
  Thread.join t1;
  Thread.join t2;

  Printf.printf "Valeur finale du compteur (attendu 2_000_000, mais incorrect): %d\n%!" !counter;
  Printf.printf "Thread principal: Fin du programme.\n%!";

  (*
  C'est exactement le code que j'ai utilisé précédemment pour démontrer la condition de concurrence (race condition). 
  Il est intentionnellement conçu sans synchronisation pour montrer le problème qui se produit lorsque 
  plusieurs threads accèdent et modifient une ressource partagée (counter) sans protection.

  Si vous exécutez ce code, la valeur finale de counter sera très probablement inférieure à 2 000 000, 
  car les incrémentations des deux threads se chevaucheront et certaines seront perdues.
  *)