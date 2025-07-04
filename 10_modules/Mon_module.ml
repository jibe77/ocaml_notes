(*
Les modules sont une des forces majeures d’OCaml — 
c’est un système très puissant pour organiser ton code, 
beaucoup plus riche que les simples "fichiers" en Java ou C.

Un module est une unité de code qui regroupe :
✅ des fonctions
✅ des types
✅ des valeurs
✅ éventuellement des sous-modules
👉 C’est un espace de noms.

Chaque fichier .ml correspond à un module du même nom (en majuscule).

ocamlc -c Mon_module.ml
ocamlc -c main.ml
ocamlc -o prog Mon_module.cmo main.cmo
./prog

(base) jean-baptisterenaux@MacBook-Pro 10_modules % ocamlc -o prog Mon_module.cmo main.cmo
(base) jean-baptisterenaux@MacBook-Pro 10_modules % ./prog 
carre 5 = 25
double 7 = 14
Rouge

La commande ocamlc permet de compiler en bytecode.

*)

let carre x = x * x
let double x = 2 * x
type couleur = Rouge | Vert | Bleu
