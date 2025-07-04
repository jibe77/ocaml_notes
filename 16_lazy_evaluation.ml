(*
Dans les langages classiques (comme C, Java, OCaml par défaut) :
👉 Quand tu appelles une fonction, tous les arguments sont évalués immédiatement avant l’exécution de la fonction.
*)

let f x y = x + y;;

print_int(f (2 + 3) (4 * 5));;
print_newline ();;

(* 
    → Ici 2 + 3 et 4 * 5 sont calculés tout de suite → résultat passé à f.
    On dit que OCaml a une "évaluation stricte" par défaut. 

🐢 2️⃣ Évaluation paresseuse (lazy)

Avec l’évaluation paresseuse :
👉 Les arguments ne sont pas évalués tant qu’on n’en a pas besoin.
→ On retarde le calcul !
→ On le fait seulement si on en a besoin plus tard.

🎁 3️⃣ Pourquoi c’est utile ?

✅ Gagner en performance (éviter des calculs inutiles)
✅ Créer des structures infinies (ex : liste infinie !)
✅ Contrôler finement quand le calcul a lieu

Ici → rien n’est calculé tout de suite.
Cela crée une valeur paresseuse.
Pour forcer le calcul → on utilise Lazy.force :
*)

let x = lazy (2 + 3);;

let y = Lazy.force x ;;  (* ici seulement on calcule 2 + 3 → y = 5 *)

print_int(y);;