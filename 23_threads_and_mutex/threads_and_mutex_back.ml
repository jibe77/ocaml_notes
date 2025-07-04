(*
Pourquoi a-t-on besoin de mutex ?
Parce que si plusieurs threads modifient les mêmes variables en même temps, on peut avoir des erreurs.
Exemple classique (erreur de "race condition") :
*)
let counter = ref 0

Thread.create (fun () -> for _ = 1 to 1_000_000 do incr counter done) ()
Thread.create (fun () -> for _ = 1 to 1_000_000 do incr counter done) ()
(*
👉 On s’attend à ce que counter vaille 2_000_000 à la fin.
Mais en réalité, sans protection, le résultat sera faux ! Pourquoi ?
Parce que incr counter n’est pas une opération atomique → plusieurs threads peuvent la faire en même temps et écraser le résultat de l’autre.

La solution → mutex
Un mutex (abréviation de mutual exclusion) est un objet qui permet de dire :
👉 un seul thread à la fois peut accéder à une section critique du code.
Avec mutex :

*)

let counter = ref 0
let mutex = Mutex.create ()

let incr_counter () =
  Mutex.lock mutex;
  counter := !counter + 1;
  Mutex.unlock mutex

Thread.create (fun () -> for _ = 1 to 1_000_000 do incr_counter () done) ()
Thread.create (fun () -> for _ = 1 to 1_000_000 do incr_counter () done) ()

(*
Détail :
Thread + Mutex = vrais threads OS (comme en Java, C, etc.).
Lwt = "threads légers" → pas de threads système → pas de mutex nécessaire si tu restes dans l’univers Lwt.
Domainslib (OCaml 5) = parallélisme moderne avec "domains" → là tu utilises Mutex aussi.
*)