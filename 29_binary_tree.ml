(*
  Définit un type d'arbre binaire 
*)
type 'a binary_tree = 
| Empty
| Node of 'a * 'a binary_tree * 'a binary_tree

(* Fonction permettant de calculer la taille d'un arbre binaire *)
let rec size tree = 
  match tree with
  | Empty -> 0
  | Node (_, left, right) -> 1 + size left + size right 

(* Exemple d'arbre binaire, ici les 9 feuilles :  


        1
      /   \
     7      9
    / \    / \
   2   6.     9
      / \.   /
     5.  11 5
*)
let example_tree = 
  Node (1,
    Node (7,
      Node(2, Empty, Empty),
      Node(6,
        Node(5, Empty, Empty),
        Node(11, Empty, Empty)
      )
    ),
    Node(9, 
      Empty,
      Node(9,
        Node(5, Empty, Empty),
        Empty)
        )
      )
    

(* Compute size *)
let binary_tree_size = size example_tree;;

(* Print the results *)
Printf.printf "Size of the binary tree: %d\n" binary_tree_size;;

(* On définit ensuite une fonction qui calcul la hauteur d'un arbre binaire *)
let rec height tree = 
  match tree with 
  | Empty -> -1 (* la hauteur d'un arbre binaire vide est -1 *)
  | Node(_,left, right) -> 1 + max(height left) (height right)

let binary_tree_height = height example_tree;;
Printf.printf "Height of the binary tree: %d\n" binary_tree_height;;

(* 
La fonction suivante récupère les noeuds de l'arbre binaire dans une liste.
*)
let rec preorder tree = 
  match tree with
  | Empty -> []
  | Node(value,left,right) -> 
    let left_preorder = preorder left in
    let right_preorder = preorder right in
    value :: (left_preorder @ right_preorder)

let solution = preorder example_tree;;
Printf.printf "Preorder traversal: %s\n" (String.concat ", " (List.map string_of_int solution))

(*
La fonction suivante retourne le minimum présent dans une feuille de l'arbre binaire.

Le type option en OCaml permet d'exprimer « peut-être une valeur ». Il a deux cas :
None : absence de valeur
Some v : présence d’une valeur v

Ici, Some sert à :
encapsuler une valeur réelle (comme un entier) dans un contexte où il est possible qu’il n’y 
ait rien à retourner (cas de l’arbre vide).
*)

let rec minimum tree = 
  match tree with 
  | Empty -> None (* Retourne None pour chaque arbre binaire vide *)
  | Node(value,left,right) ->
  let min_left = minimum left in
  let min_righ = minimum right in 
  match (min_left, min_righ) with
  (* Si les deux sous-arbres sont vides, la valeur du nœud courant est la seule présente ⇒ on la renvoie avec Some. *)
  | (None, None) -> Some value
  (* Si seul le sous-arbre gauche contient un minimum, on le compare avec value *)
  | (Some left_min, None) -> Some (min left_min value)
  (* Idem si seul le sous-arbre droit est non vide. *)
  | (None, Some right_min) -> Some (min right_min value)
  (* Si les deux sous-arbres ont un minimum, on prend le minimum parmi les trois valeurs : gauche, courant, droite. *)
  | (Some left_min, Some right_min) -> Some(min (min left_min value) right_min)

let result = minimum example_tree;;
match result with
  | Some min_val -> Printf.printf "Minimum value: %d\n" min_val
  | None -> Printf.printf "The binary tree is empty\n"