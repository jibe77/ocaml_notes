let dire_bonjour () = 
  print_endline "Bonjour !";;

(* Appel *)
dire_bonjour ();;

(* fonctions anonymes *)
let result = (fun x -> x + 1) 5;;
print_int result;;