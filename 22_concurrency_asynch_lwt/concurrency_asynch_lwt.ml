(*
  👉 Lwt (Lightweight Thread) est une bibliothèque OCaml pour écrire du code asynchrone.
  Elle permet de faire des choses en parallèle sans bloquer le programme.

  👉 Thread = vrais threads → plusieurs cœurs → il faut protéger la mémoire partagée → usage classique de "parallélisme".  
  👉 Lwt = fausse concurrence → un seul thread OS → pas besoin de mutex → usage pour "I/O asynchrone", serveurs, tâches réseau, etc.

  Pour utiliser Lwt, il faut que le module soit installé — car ce n'est pas dans la bibliothèque standard d'OCaml.

    > opam install lwt

  Quand tu appelles une fonction Lwt, elle ne te rend pas la valeur directement.
  Elle te donne une promesse (promise), qu’on note : 'a Lwt.t
  → une "valeur future", que tu recevras quand elle sera prête.
  Exemple :
    val Lwt_unix.sleep : float -> unit Lwt.t

  Cette fonction "dort" un certain temps, sans bloquer le programme.

  Remarque : il faut que le code soit compilé car ce n'est pas une librairie standard

    % ocamlfind ocamlopt -linkpkg -package lwt.unix -o mon_programme concurrency_asynch_lwt.ml
    ./mon_programme
    
*)

open Lwt.Infix

let () =
  Lwt_main.run (
    Lwt_io.printl "Début" >>= fun () ->
    Lwt_unix.sleep 2.0 >>= fun () ->
    Lwt_io.printl "Fin"
  )
 (*
 Explication :
  1️⃣ Lwt_io.printl "Début" → imprime "Début", retourne une promesse.
  2️⃣ >>= → "quand c’est prêt", on passe à la suite.
  3️⃣ Lwt_unix.sleep 2.0 → attend 2 secondes, sans bloquer.
  4️⃣ Ensuite on imprime "Fin".
 *)

 (*
     > opam install lwt_ppx
 *)

 let () =
  Lwt_main.run (
    let%lwt () = Lwt_io.printl "Début" in
    let%lwt () = Lwt_unix.sleep 2.0 in
    Lwt_io.printl "Fin"
  )

  (*
  Le programme peut continuer à faire autre chose pendant qu’il attend.
  On peut lancer plusieurs tâches en parallèle.
  *)

  (*
  Ici on peut exécuter plusieurs choses en même temps
  *)

  let () =
  Lwt_main.run (
    Lwt.join [
      Lwt_io.printl "Tâche 1";
      (Lwt_unix.sleep 1.0 >>= fun () -> Lwt_io.printl "Tâche 2 après 1s")
    ]
  )

  (*
  Exemple de différence philosophique :
    Si tu fais un serveur web → Lwt est plus adapté : il fait de l’I/O non bloquante.
    Si tu fais un programme qui doit calculer en parallèle sur plusieurs cœurs → Thread est plus adapté (ou Domainslib si OCaml 5).
    Très important
    👉 On ne mélange jamais directement Thread et Lwt dans le même code → ce sont deux modèles incompatibles.
  *)