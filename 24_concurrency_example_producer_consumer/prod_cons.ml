(* Compilation : ocamlfind ocamlopt -thread -package threads -linkpkg -o prod_cons prod_cons.ml *)

open Thread
open Mutex
open Condition

(* Buffer partagé *)
let buffer = Queue.create ()

(* Mutex pour protéger le buffer *)
let mutex = Mutex.create ()

(* Condition pour signaler la présence d'un élément *)
let cond_not_empty = Condition.create ()

(* Paramètres *)
let max_items = 10

(* Producteur *)
let producer () =
  for i = 1 to max_items do
    Thread.delay (Random.float 0.5);  (* Simuler du travail *)
    Mutex.lock mutex;
    Queue.add i buffer;
    Printf.printf "Producer: produced %d\n%!" i;
    Condition.signal cond_not_empty;
    Mutex.unlock mutex;
  done

(* Consommateur *)
let consumer () =
  for _ = 1 to max_items do
    Mutex.lock mutex;
    while Queue.is_empty buffer do
      Condition.wait cond_not_empty mutex
    done;
    let item = Queue.take buffer in
    Printf.printf "Consumer: consumed %d\n%!" item;
    Mutex.unlock mutex;
    Thread.delay (Random.float 0.5);  (* Simuler du traitement *)
  done

(* Main *)
let () =
  Random.self_init ();

  let prod_thread = Thread.create producer () in
  let cons_thread = Thread.create consumer () in

  Thread.join prod_thread;
  Thread.join cons_thread;

  Printf.printf "Done!\n"
