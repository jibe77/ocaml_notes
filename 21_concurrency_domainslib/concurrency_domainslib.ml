(* Domainslib est une petite bibliothèque pour faire de la concurrence parallèle "sûre" en OCaml multicore. 

✅ Elle repose sur :
les Domaines (vrais threads parallèles)
une pool de work-stealing (workers qui s’échangent les tâches dynamiquement)
et sur le style fonctionnel : pas de partage mutable.
*)

(* 
  l'installation se passe en tapant cette commande : 
    opam install domainslib 

  et il faut ensuite obligatoirement compiler : 
    ocamlfind ocamlopt -package domainslib -linkpkg -o concurrency_domainslib concurrency_domainslib.ml

  ocamlopt permet de compiler en code natif.
*)
open Domainslib

(*
1 : Tu crées une pool de "Domaines" (threads) :
*)
let () =
  let pool = Task.setup_pool ~num_domains:4 () in
  (*
    → Ici on crée 4 threads de calcul.

    2 : Tu soumets des tâches à exécuter sur ce pool :
  *)
  Domainslib.Task.run pool (fun () ->
    Domainslib.Task.parallel_for pool
      ~start:100
      ~finish:199
      ~chunk_size:5 (* nombre d'élément distribué à chaque Thread à chaque fois qu'il vient prendre des éléments*)
      ~body:(fun i ->
        Printf.printf "Traitement %d\n%!" i
      )
  );




(* 
3: Quand c’est fini → tu fermes le pool : 
*)
  Task.teardown_pool pool

  

