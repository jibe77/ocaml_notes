(* 

📂 .ml → fichier de code source (implémentation)

C’est là où tu écris le code complet :
  définitions de fonctions
  définitions de types
  logique du programme

*)

let carre x = x * x

let double x = 2 * x

type couleur = Rouge | Vert | Bleu

(* Fonction interne non exposée *)
let secret x = x + 42
