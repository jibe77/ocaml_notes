(* 
  👉 Une structure persistante est une structure de données qui ne disparaît pas ni ne change quand tu la modifies :
  ✅ Au lieu de modifier l’ancienne version, on crée une nouvelle version,
  ✅ En réutilisant une grande partie de l’ancienne pour ne pas consommer trop de mémoire.
*)

let l1 = [1; 2; 3]
let l2 = 0 :: l1

(*
  Ici :
  l1 est [1; 2; 3]
  l2 est [0; 1; 2; 3]
  👉 La liste l1 n’a pas changé.
  👉 l2 réutilise le même suffixe [1; 2; 3] que l1

  → Les deux versions existent en parallèle → c’est persistant.

  👉 C’est ce qui rend la programmation fonctionnelle fluide et sûre :
  ✅ On ne casse pas les données partagées.
  ✅ On peut facilement revenir en arrière.
  ✅ On compose les transformations.
*)