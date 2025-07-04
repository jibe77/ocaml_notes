(* 
  👉 Un arbre est une structure de données composée de :
  ✅ nœuds
  ✅ chaque nœud a des fils (sous-arbres)
  Exemple très courant : arbre binaire :
*)

type 'a tree = 
  | Empty
  | Node of 'a * 'a tree * 'a tree

(* 
Quand on modifie un arbre immuable (comme en OCaml) :
👉 on ne modifie pas les anciens nœuds en place.
👉 on crée un nouvel arbre, qui réutilise autant que possible les parties inchangées.
C’est exactement le principe de structure persistante.

'a tree =
    Empty
  | Node (valeur, sous-arbre gauche, sous-arbre droit)

*)

(* 
    3
   / \
  1   5
*)
let t1 = Node (3, Node (1, Empty, Empty), Node (5, Empty, Empty))

(* Maintenant, imaginons qu’on veut insérer 4 → on obtient un nouvel arbre t2. 
    3
   / \
  1   5
       \
        4
*)


(* 
  t1 et t2 partagent tout le sous-arbre gauche.
  → Pas de copie complète de l’arbre → c’est très efficace en mémoire.
*)

(* On réutilise le sous-arbre gauche de t1 *)
let gauche = match t1 with Node (_, g, _) -> g | _ -> failwith "erreur"

(* On construit un nouveau sous-arbre droit *)
let droit_modifie = Node (5, Node (4, Empty, Empty), Empty)

(* On construit le nouvel arbre *)
let t2 = Node (3, gauche, droit_modifie)

(* 
Quand on voit un nom qui commence par une apostrophe en OCaml, comme 'a, 'b, 'key, etc., ce n'est pas une variable au sens classique.
→ C’est ce qu’on appelle un paramètre de type ou variable de type.

Ici 'a tree veut dire :
➡️ un arbre qui contient des choses de type 'a
(et 'a peut être n’importe quoi)

👉 'a = un type qu’on ne connaît pas encore, qui sera décidé plus tard.
👉 Ça permet de faire du code qui marche avec plein de types différents.
*)