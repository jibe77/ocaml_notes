(* 
👉 Une closure est une fonction qui capture des variables de son environnement. 
Quand tu crées une fonction à l’intérieur d’une autre fonction, cette fonction 
"se souvient" des variables de l’environnement où elle a été créée.
*)

let creer_multiplicateur facteur =
  fun x -> facteur * x

let double = creer_multiplicateur 2
let triple = creer_multiplicateur 3

let () =
  Printf.printf "Double de 5 = %d\n" (double 5);
  Printf.printf "Triple de 4 = %d\n" (triple 4)

(*
Closure et fonction d’ordre supérieur sont deux concepts liés, mais ce n’est pas la même chose.

🏗️ 5️⃣ Métaphore
Fonction d’ordre supérieur → c’est la recette (le fait de produire ou manipuler des fonctions)
Closure → c’est le plat cuisiné (une fonction qui "emporte" son environnement avec elle)

la différence est subtile, car en OCaml les deux concepts sont très liés.

*)
