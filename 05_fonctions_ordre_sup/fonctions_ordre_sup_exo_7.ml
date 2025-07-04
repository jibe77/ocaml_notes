(*
  Listes infinies

  On définit une fonction qui génère une liste potentiellement infinie d'éléments.

  Exemple : 

    take 8 nats renvoie [0;1;2;3;4;5;6;7]
*)

(* 
Un flux (stream) de valeurs de type 'a est fait :
d'une valeur (comme un nombre),
et d'une promesse de continuer ce flux plus tard.

'a : c’est un type générique. Ça veut dire que le flux peut contenir des nombres, des chaînes, ou n’importe quoi d’autre.

* : ça veut dire “et”. Donc un stream est fait :
d’un élément de type 'a,
et d’un reste du flux, mais qu’on n’évaluera que si on en a besoin (c’est ça le Lazy.t).
*)

type 'a stream = Cons of 'a * 'a stream Lazy.t

(*
C’est un flux infini de 1.
lazy ones signifie que le reste du flux n’est pas immédiatement évalué — cela évite une récursion infinie directe.
*)

let rec nats_from start = Cons (start, lazy (nats_from(start+1)))

let nats = nats_from 0

let rec take n (Cons (x, xs)) =
  if n <= 0 then []
  else x :: take (n-1) (Lazy.force xs)

let result1 = take 8 nats ;;
let result2 = take 5 nats ;;

Printf.printf "take 8 nats -> [%s]\n" (String.concat "; " (List.map string_of_int result1));
Printf.printf "take 5 nats -> [%s]\n" (String.concat "; " (List.map string_of_int result2));