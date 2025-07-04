(*
🚀 Pourquoi utiliser .mli ?
✅ Pour cacher l’implémentation → le reste du programme ne voit que ce que tu exposes.
✅ Pour documenter ton module.
✅ Pour forcer l’abstraction → tu peux cacher des détails internes.
*)

val carre : int -> int
val double : int -> int

type couleur = Rouge | Vert | Bleu
