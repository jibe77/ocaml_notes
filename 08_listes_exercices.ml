(* 
Récupération du dernier élément d'une liste
*)

let rec last_element lst = 
  match lst with
  | [] -> failwith "Empty list has no last element"
  | [x] -> x
  | _ :: tail -> last_element tail 
  
let numbers = [1; 8; 2; 5];;
let result = last_element numbers in
Printf.printf "The last element is : %d\n" result;;

let words = ["sea"; "water"; "ocean"];;
let result = last_element words in
Printf.printf "The last element is : %s\n" result;;

(*
Récupération de l'avant dernier élément d'une liste
*)
let rec before_last lst = 
  match lst with
  | [] -> failwith "List is empty"
  | [_] -> failwith "List with only one element"
  | [x; _] -> x
  | _ :: tail -> before_last tail

let result = before_last words ;;
Printf.printf "The penultimate element is %s\n" result;;

(* 
Duplique les éléments de la liste passée en paramètre
*)
let rec print_lst lst = 
  match lst with 
  | [] -> ()
  | [x] -> Printf.printf "%s\n" x
  | x :: xs   -> Printf.printf "%s;" x; print_lst xs

let rec duplicate_lst lst =
  match lst with 
  | [] -> []
  | head :: tail -> head :: head :: duplicate_lst tail

let result = duplicate_lst words;;
print_lst result;;

(*
Calcul de la moyenne
*)

let average lst = 
  let sum = List.fold_left (+) 0 lst in
  let count = List.length lst in
  float_of_int sum /. float_of_int count;;

let numbers = [8; 1; 3; 9];;
let avg = average numbers;;
Printf.printf "average: %.2f\n" avg;;

(*
Insertion in Position
*)

let insert_in elem str pos = 
  let len = String.length str in 
  if pos < 1 || pos > len then
    failwith "Position out of bounds"
  else
    let prefix = String.sub str 0 pos in
    let suffix = String.sub str pos (len-pos) in
    prefix ^ (String.make 1 elem) ^ suffix

let original_string = "abcd";;
let resulting_string = insert_in 'X' original_string 1;;

Printf.printf "Original string : \"%s\"\n" original_string;
Printf.printf "Modified string : \"%s\"\n" resulting_string;