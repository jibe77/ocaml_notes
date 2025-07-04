(*
    * Comprendre le GC de la VM OCaml
    * Allocation automatique
    * Immutabilité comme outil de sûreté mémoire
    * Profiler le GC (`ocamlprof`, `ocp-memprof`)
*)

(* 
OCaml utilise un ramasse-miettes (GC) automatique pour gérer la mémoire. Il est :
    Générationnel : divise les objets selon leur âge
    Incrémental et coopératif : évite les longues pauses, fonctionne avec le programme
    Compacteur : réorganise la mémoire pour éviter la fragmentation (dans le major heap)

Deux grandes zones mémoire :
    Minor heap	Allocation très rapide d'objets récents	Collecte fréquente (mineure)
    Major heap	Objets à durée de vie longue	Collecte moins fréquente (majeure), mais plus coûteuse

*)

(* 
Allocation automatique:
En OCaml, tu n’as pas à allouer ou libérer explicitement la mémoire (pas de malloc ou free comme en C).

Caractéristiques :
Toute valeur complexe (liste, tuple, closure…) est automatiquement allouée dans le minor heap
Les valeurs simples (entiers, booléens, float non boxé) sont stockées directement en registre ou sur la pile

⚠️ Les allocations rapides sont très efficaces mais génèrent rapidement du garbage → d'où l’importance du GC.
*)

(*
3. Immutabilité comme outil de sûreté mémoire
OCaml est par défaut un langage fonctionnel avec des valeurs immuables, ce qui apporte :

✅ Sécurité mémoire
    Pas de modification de données partagées
    Évite les pointeurs sauvages, race conditions, segfaults
✅ Facilité du GC
    Si une structure est immuable, et n’est plus référencée, elle peut être nettoyée sans risque.

let l1 = [1; 2; 3]
let l2 = 0 :: l1 (* l1 est réutilisée, pas copiée ni modifiée *)

➡️ Pas de duplication inutile, pas de fuite mémoire, comportement prévisible.
*)

(*
🔹 4. Profiler le GC (ocamlprof, ocp-memprof)
    Ces outils aident à analyser les performances et comprendre les allocations mémoire.
    ocamlprof :
        Sert surtout au profilage de couverture (quelles fonctions sont appelées, combien de fois)
        Peu utile pour le profil mémoire
    
    ocp-memprof (plus pertinent ici) :
        Outil de profilage mémoire avancé créé par OCamlPro
        Permet de :
        Voir où sont faites les allocations
        Identifier les fuites mémoire
        Suivre les coûts d’allocation par fonction

    ocp-memprof run ./mon_programme
    ocp-memprof report

*)