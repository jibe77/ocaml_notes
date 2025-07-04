(*
👉 C’est un type qui "compose" plusieurs autres types.
Par exemple :
une paire (int * string)
une liste int list
un option int option
un enregistrement { champ1 : int; champ2 : string }
un variant (type énuméré)
*)

(* (int * string) *)
let p = (3, "bonjour");;

(* Liste *)
let l = [1; 2; 3; 4];;

(* record *)
type personne = { nom : string; age : int };;

let p = { nom = "Alice"; age = 30 };;

(* option *)
(* 
x : int option
y : 'a option
*)
let x = Some 5;;
let y = None;;

(* 
  Some x → il y a une valeur x de type 'a
  None → il n’y a rien
*)
type 'a option = 
    | Some of 'a   (* une valeur de type 'a *)
    | None         (* aucune valeur *)

(* Exemple typique : fonction qui cherche dans une liste *)
let rec trouve_premier_pair liste =
  match liste with
  | [] -> None
  | x :: xs -> if x mod 2 = 0 then Some x else trouve_premier_pair xs


(* Variant (enum avec données possibles) *)
type couleur = Rouge | Vert | Bleu;;

let c = Rouge;;

type resultat = Ok of string | Erreur of string;;

let r = Ok "Tout va bien";;

