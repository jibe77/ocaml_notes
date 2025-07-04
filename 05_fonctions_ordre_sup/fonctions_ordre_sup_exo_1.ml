(*

Implémenter une fonction qui compare deux listes.

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

let eql xs ys =
  let condition x y = x = y in
  let zipped = zipWith condition xs ys in (* zipped est la liste des comparaisons élément par élément : [true; true; false; ...]. *)
  let lengths_equal = List.length xs = List.length ys in (* lengths_equal vérifie que les deux listes ont la même longueur *)
  lengths_equal && List.fold_left (&&) true zipped (* List.fold_left (&&) true zipped retourne true seulement si tous les éléments sont true. *)
  (* Résultat final : true si toutes les paires sont égales et les listes ont même longueur *)
  
let list1 = [1; 2; 3; 4; 5];;
let list2 = [1; 2; 3; 4; 5];;
let list3 = [1; 2; 3; 4; 6];;

let result1 = eql list1 list2;;
let result2 = eql list1 list3;;

Printf.printf "Are list1 and list2 equal? %b\n" result1;;
Printf.printf "Are list1 and list3 equal? %b\n" result2;;


