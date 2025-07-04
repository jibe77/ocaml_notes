* Programmation générique

## **Semaine 5 — Programmation concurrente**

* Introduction à la concurrence
* Problèmes classiques : interblocages, conditions de course
* Communication par message (vs. mémoire partagée)
* Paradigme CSP (Communicating Sequential Processes)

  * → **En OCaml** :

    * Lib : `Domainslib` (programmation concurrente native)
    * Lib : `Lwt` ou `Async` pour la concurrence asynchrone
    * Threads OCaml (`Thread` et `Mutex`)
    * Exemples : producteurs/consommateurs, pipelines concurrentiels

## **Semaine 6 — Gestion sécurisée de la mémoire**

* Allocation et désallocation
* Garbage Collection
* Éviter les erreurs de mémoire (segfaults, use-after-free)

  * → **En OCaml** :

    * Comprendre le GC de la VM OCaml
    * Allocation automatique
    * Immutabilité comme outil de sûreté mémoire
    * Profiler le GC (`ocamlprof`, `ocp-memprof`)

## **Semaine 7 — Gestion sûre des effets**

* Effets de bord et contrôle
* Monades (notion)
* Traitement des exceptions

  * → **En OCaml** :

    * Gestion d’exceptions : `try ... with`
    * Monade `option`, monade `result`
    * Programmation avec `Lwt` (monadisation des IO asynchrones)

    ## **Semaine 8 — Études de cas & intégration multi-paradigme**

* Combinaison de paradigmes
* Études de cas : mini-langage, serveur concurrent, système réactif

  * → **En OCaml** :

    * Architecture modulaire
    * Gestion d’état fonctionnelle
    * Modèle acteur avec `Lwt` ou `Async`
    * Conception d’un serveur Web simple en OCaml

Autre : 
  la composition fonctionnelle (f >> g)