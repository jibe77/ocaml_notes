(* 

Un pipeline concurrentiel est un modèle d’exécution où :
Un traitement est divisé en étapes successives (comme une chaîne de montage)
Chaque étape est exécutée indépendamment dans un thread, processus ou coroutine
Les données circulent entre les étapes, souvent via des files (queues)
Chaque étape peut fonctionner en parallèle avec les autres → gain de performance

Exemple concret (métaphore usine) :
Supposons une fabrique de pizzas :
Étape 1 : préparation de la pâte
Étape 2 : mise en garniture
Étape 3 : cuisson
Étape 4 : emballage
Chaque étape peut être exécutée par une unité distincte (thread), et pendant qu'une pizza cuit, une autre est déjà en préparation.

🚀 Pourquoi utiliser un pipeline concurrentiel en OCaml ?
Pour traiter un flux de données de manière efficace (ex : streaming, transformation de fichiers, serveur réseau)
Pour profiter du parallélisme (avec Threads ou Domainslib)
Pour gagner du temps : chaque étape tourne dès qu’elle a de quoi travailler, sans attendre la fin de la précédente

🔧 Objectif du pipeline (même que précédemment)
Génère les nombres de 1 à 5
Double chaque nombre
Affiche le résultat
Mais cette fois avec Lwt_stream, sans threads système ni mutex : tout est asynchrone, non bloquant.

🎯 Objectif
On va simuler une chaîne de production de pizzas en 3 étapes :
Préparation (la pâte est façonnée)
Cuisson (on la fait cuire)
Emballage (on met la pizza dans une boîte)
Chaque étape est une fonction dans un pipeline asynchrone, basée sur Lwt_stream.

*)

open Lwt.Infix

type pizza = {
  id : int;
  state : string;
}

(* Étape 1 : préparation *)
let prepare () =
  let stream, push = Lwt_stream.create () in
  let rec loop n =
    if n > 5 then (
      push None;
      Lwt.return_unit
    ) else (
      let p = { id = n; state = "pâte préparée" } in
      Lwt_io.printf "[Préparation] Pizza %d\n%!" p.id >>= fun () ->
      push (Some p);
      Lwt_unix.sleep 0.5 >>= fun () ->
      loop (n + 1)
    )
  in
  Lwt.async (fun () -> loop 1);
  Lwt.return stream

(* Étape 2 : cuisson *)
let cuisson stream =
  Lwt_stream.map_s (fun pizza ->
    let cooked = { pizza with state = "cuite" } in
    Lwt_io.printf "[Cuisson] Pizza %d\n%!" pizza.id >>= fun () ->
    Lwt_unix.sleep 0.7 >>= fun () ->
    Lwt.return cooked
  ) stream

(* Étape 3 : emballage *)
let emballage stream =
  Lwt_stream.iter_s (fun pizza ->
    let final = { pizza with state = "emballée" } in
    Lwt_io.printf "[Emballage] Pizza %d : %s\n%!" final.id final.state
  ) stream

let () =
  Lwt_main.run (
    prepare () >>= fun s1 ->
    let s2 = cuisson s1 in
    emballage s2
  )

  (* 
      ocamlfind ocamlopt -linkpkg -package lwt.unix -o pizza_pipeline pizza_pipeline.ml
  *)