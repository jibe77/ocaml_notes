(*
 Retourne val a : int = 5 indiquant ainsi que a est un entier.
 Il y a également le type float, val b : float = 5.
 *)
 
 let a = 5;;
let b = 5.0;;

 (*
 Concernant l'addition des flottants, il faut par exemple utiliser +.
 pour faire l'addition de nombres flottants sinon on a une erreur.
 Pareil pour les autres opérations mathématique, comme *. pour la multiplication de flottants.
 *)
 let c = b +. 6.2;;

(* 
 Ici on créé une chaine de caractères.
 val a : char = 'a'
 val s : string = "bonjour"
 val concat : string = "bonjourbonjour"
*)
let c = 'a';;
let s = 'bonjour';;
let concat = s^s;;

(* 
 Ici on voit les booleans

 val b : bool = false
 - : bool = true
*)
let b = false;;
if (b<>true) then true else false;;

(* 
  si vous écrivez du code dans un fichier .ml que vous allez compiler (avec ocamlc ou dune), 
  vous utiliserez ``;pour enchaîner vos opérations. Vous n'utiliserez;;` que si vous êtes 
  dans l'interpréteur OCaml (le toplevel) ou si votre projet a une convention très spécifique 
  pour son utilisation dans les fichiers sources.
*)