(*
  Calcul du produit scalaire de deux vecteurs

  Exemple :

  scalarProduct [2.0; 1.0; 5.0] [3.0; 2.0; 2.0] retourne 18.0
*)

(*
Elle prend une fonction f et deux listes xs et ys.
Elle applique f à chaque paire (x, y) de xs et ys, jusqu'à ce qu’une des deux listes soit vide.
Elle renvoie une liste de résultats f x y.
🔍 Ex. :
zipWith (+) [1; 2; 3] [10; 20; 30] → [11; 22; 33]
*)
let rec zipWith f xs ys = 
  match(xs,ys) with
  | ([],_) | (_,[]) -> []
  | (x :: xs', y :: ys') -> f x y :: zipWith f xs' ys'

let scalarProduct x y = 
  let multiply = fun a b -> a *. b in 
  List.fold_left (+.) 0.0 (zipWith multiply x y)

let solution = scalarProduct[2.0;1.0;5.0] [3.0; 2.0; 2.0];;

Printf.printf "Scalar product %f\n" solution

(*
Dans la fonction suivante on doit aplatir la liste qui contient des listes

Exemple :

flatten [[1;2;3]; [4;5]; [6]; []; [3; 3]] -> [1;2;3;4;5;6;3;3]
*)

let flatten main_list = 
    (* signifie que l'on aplatit une liste de listes en une liste unique, en conservant l’ordre d’origine *)
    (* List.fold_right parcourt la liste de droite à gauche (donc en partant de la fin). *)
    (* La  fonction anonyme (fun sublist acc -> sublist @ acc) concatène chaque sous-liste sublist avec l’accumulateur acc 
      Exemple : [1;2] @ [3;4;5] → [1;2;3;4;5]
    *)
    List.fold_right (fun sublist acc -> sublist @ acc) main_list []

let lists = [[1;2;3]; [4;5]; [6]; []; [3; 3]]

let flattened = flatten lists;;

List.iter (fun x -> Printf.printf "%d;" x) flattened;;

Printf.printf "\n"

(*
La fonction suivante retourne la taille d'une chaine de caractères.

  Soleil retourne 6
*)

(* 
1. let my_length s =
Déclare une fonction nommée my_length qui prend une chaîne s en argument.

2. let count_char _ = 1
Fonction count_char qui ignore son argument (_) et retourne 1.
En gros, cette fonction transforme chaque caractère en 1 → comme une sorte de compteur unitaire.

3. String.to_seq s |> List.of_seq
Convertit la chaîne de caractères s en séquence (seq) de caractères, puis en liste.
Par exemple, "abc" devient ['a'; 'b'; 'c'].

*)
let my_length s = 
  let count_char _ = 1 in
  let char_count_list = List.map count_char (String.to_seq s |> List.of_seq) in
  List.fold_left (+) 0 char_count_list

let str = "Thomas";;
let length = my_length str ;; 
Printf.printf "The length of '%s' is %d\n" str length;;

(* 
Dans la fonction suivante, on inverse une liste d'entiers
*)
let myReverse lst = 
  List.fold_left (fun acc x -> x :: acc) [] lst

let original = [1;2;3;4;5;6;7;8;9;10];;

let reversed = myReverse original;;

Printf.printf "Original List: [%s]\n"
  (String.concat "; " (List.map string_of_int original));;

Printf.printf "Reversed List: [%s]\n"
  (String.concat "; " (List.map string_of_int reversed));;

(*
Implémente une fonction firstWord qui retourne le premier mot d'une chaine de caractères.

  Exemple : "Pizza is delicious" retourne "Pizza"
*)
let firstWord s =
  let words = String.split_on_char ' ' s in
  let filtered_words = List.filter (fun word -> String.length word > 0) words in
  match filtered_words with 
  | [] -> ""
  | first_word :: _ -> first_word

let input_str = " Good morning sir !";;
let result = firstWord input_str;;
Printf.printf "result : %s.\n" result;;

(*
Implémente la fonction countIf compte le nombre d'éléments qui correspondent au prédicat.

  countIf :  (int -> bool) -> int list -> int

Cette fonction qui prend deux arguments : 
  un prédicat p de type int -> bool c'est à dire qu'il prend un entier en entrée et retourne une liste,
  une liste d'entiers, 
  et retourne un entier (le résultat du comptage)
*)
let countIf f lst = 
  List.length (List.filter f lst)

let predicate x = x > 5;;

let example_list = [1;2;3;4;5;6;7;8;9;10];;
let result = countIf predicate example_list;;
Printf.printf "Number of elements satisfying the predicate: %d.\n" result

(*
On définit une fonction permettant de combiner des éléments avec des prédicats : 

  combined : int list -> (int -> int) list -> int list

🔍 Décomposition :
Partie	Signification
int list	Une liste d'entiers – appelons-la lst
(int -> int) list	Une liste de fonctions, chacune prenant un int et retournant un int – appelons-la funs
int list (résultat)	Une nouvelle liste d'entiers, produite par transformation
*)

let combined (lst : int list)
  (fs : (int -> int ) list ) : int list list =
  List.map (fun f -> List.map f lst) fs

let input_list = [1;2;3];;
let functions = [(fun x -> x + 1); (fun x -> 2*x); (fun x -> x * x)];;

let result = combined input_list functions;;
Printf.printf "[[%s]]\n"
  (String.concat "], [" (List.map(fun lst -> String.concat "; " (List.map string_of_int lst)) result))