(* 

👉 Un foncteur est un module paramétré par un autre module.

✅ C’est comme une fonction,
✅ Mais au lieu de prendre des valeurs en argument,
✅ Elle prend un module en argument, et retourne un nouveau module.

Pourquoi c’est utile ?
✅ Pour générer des modules personnalisés
✅ Pour factoriser du code
✅ Pour écrire des bibliothèques génériques
✅ Pour appliquer le principe DRY ("Don’t Repeat Yourself")
*)
(* On définit un module signature (interface) pour le module en paramètre *)
module type COMPARABLE = sig
  type t
  val compare : t -> t -> int
end

(* On écrit un foncteur qui prend module C de type COMPARABLE*)
module MakeSet (C : COMPARABLE) = struct
  let equal x y = (C.compare x y) = 0
end

module IntCompare = struct
  type t = int
  let compare x y = x - y
end

module IntSet = MakeSet(IntCompare)
