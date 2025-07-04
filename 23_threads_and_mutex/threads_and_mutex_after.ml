(* Pour compiler ce code, vous aurez besoin de l'option -thread et du package threads :
   ocamlfind ocamlopt -thread -package threads -linkpkg -o threads_and_mutex_after threads_and_mutex_after.m
*)

open Thread
open Mutex (* Importe le module Mutex pour la synchronisation *)

let counter = ref 0
let mutex = Mutex.create () (* Crée une nouvelle instance de mutex *)

(* La fonction que chaque thread va exécuter *)
let worker_incrementer () =
  for _ = 1 to 1_000_000 do
    Mutex.lock mutex;   (* Acquiert le verrou : un seul thread peut passer ici à la fois *)
    incr counter;       (* Section critique : l'incrémentation de la variable partagée *)
    Mutex.unlock mutex; (* Relâche le verrou, permettant à d'autres threads de l'acquérir *)
  done

let () =
  Printf.printf "Thread principal: Démarrage du test avec synchronisation par mutex.\n%!";

  (* Création des threads *)
  let t1 = Thread.create worker_incrementer () in
  let t2 = Thread.create worker_incrementer () in

  (* Attendre la fin de l'exécution des deux threads *)
  Thread.join t1;
  Thread.join t2;

  Printf.printf "Thread principal: Tous les threads ont terminé.\n%!";
  Printf.printf "Valeur finale du compteur (doit être 2_000_000): %d\n%!" !counter;
  Printf.printf "Thread principal: Fin du programme.\n%!";