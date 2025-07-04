(*
Quand on parle d’optimisation d’une fonction récursive, on veut en fait améliorer :
✅ L’efficacité en mémoire (éviter le dépassement de pile)
✅ Le temps d’exécution (éviter les recalculs inutiles)
✅ La lisibilité / maintenance du code

🔍 Pourquoi les fonctions récursives peuvent poser problème ?

Chaque appel récursif crée un nouveau "cadre" sur la pile d’exécution.
Si la fonction est mal écrite, la pile peut exploser → Stack overflow.
Parfois, certaines fonctions recalculent sans arrêt les mêmes valeurs → perte de temps.

Techniques d’optimisation : 

🚀 1️⃣ Récursivité terminale (tail recursion)

👉 Transformer une fonction en récursive terminale permet au compilateur d’optimiser en boucle (voir partie 13).

🎲 2️⃣ Mémorisation (memoization)

👉 Éviter de recalculer plusieurs fois la même chose.

Exemple typique : suite de Fibonacci.

Version naïve (très lente !) : *)
let rec fib n =
  if n <= 1 then n
  else fib (n-1) + fib (n-2)
(*
→ Cette version recalculera fib (n-2) plusieurs milliers de fois → très inefficace.
Version optimisée avec mémoire : *)
let fib =
  let table = Hashtbl.create 100 in
  let rec fib_memo n =
    if Hashtbl.mem table n then Hashtbl.find table n
    else
      let res =
        if n <= 1 then n
        else fib_memo (n-1) + fib_memo (n-2)
      in
      Hashtbl.add table n res;
      res
  in
  fib_memo
  (*
→ Ici, chaque valeur de fib n est calculée une seule fois et mémorisée.

🪄 3️⃣ Transformer en boucle

Dans certains cas, on peut aussi décider carrément de transformer la récursion en boucle.
Exemple : au lieu d’une récursion sur un compteur, faire une simple boucle for ou while.

📝 Résumé

Technique	                    Gain
Récursivité terminale	        Moins de consommation de pile
Mémorisation	                Moins de calculs redondants
Transformation en boucle	    Parfois plus lisible et plus rapide

👉 Optimiser une fonction récursive, c’est :
✅ La rendre récursive terminale quand c’est possible
✅ Éviter les recalculs avec une table de mémoire si besoin
✅ Réduire la consommation de mémoire (pile)
✅ Parfois la transformer en boucle pour plus de lisibilité et de performance

*)

