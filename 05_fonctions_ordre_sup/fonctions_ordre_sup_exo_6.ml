(*
  Listes infinies
*)

(*
C’est un type récursif paramétré, similaire à une liste, mais conçu pour être paresseux et potentiellement infini.

Cons contient :
Une valeur de type 'a (l’élément courant).
Un flux paresseux ('a stream Lazy.t) représentant le reste du flux, qui ne sera évalué que lorsqu’on en a besoin.
*)

type 'a stream = Cons of 'a * 'a stream Lazy.t

(*
C’est un flux infini de 1.
lazy ones signifie que le reste du flux n’est pas immédiatement évalué — cela évite une récursion infinie directe.
*)

let rec ones = Cons (1, lazy ones)

let rec take n (Cons (x, xs)) =
  if n <= 0 then []
    (* Lazy.force xs permet de forcer l’évaluation du flux paresseux (sinon xs reste un thunk non évalué). *)
  else x :: take (n-1) (Lazy.force xs)

let result1 = take 8 ones ;;
let result2 = take 5 ones ;;

Printf.printf "take 8 ones -> [%s]\n" (String.concat "; " (List.map string_of_int result1));
Printf.printf "take 5 ones -> [%s]\n" (String.concat "; " (List.map string_of_int result2));