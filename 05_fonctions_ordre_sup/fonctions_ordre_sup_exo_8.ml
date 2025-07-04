(*
  Listes infinies d'entier

  On définit une fonction qui génère une liste potentiellement infinie d'entiers.

  Exemple : 

    take 8 ints renvoie [0;1;-1;2;-2;3;-3;4;-4;5;-5;6;-6;7;-7]
*)

type 'a stream = Cons of 'a * 'a stream Lazy.t

let rec ints_from start =
  let next_value x =
    if x > 0 then -x else 1 - x 
  in 
  let rec helper n = 
    Cons (n, lazy (helper (next_value n)))
  in 
  helper start 

let ints = ints_from 0

let rec take n (Cons (x, xs)) = 
  if n <= 0 then []
  else x :: take (n-1) (Lazy.force xs)

let result1 = take 8 ints ;;
let result2 = take 5 ints ;;

Printf.printf "take 8 ints -> [%s]\n" (String.concat "; " (List.map string_of_int result1));
Printf.printf "take 5 ints -> [%s]\n" (String.concat "; " (List.map string_of_int result2));

(*
La fonction suivante retourne une liste avec les nombres factoriels.

n      n'
0.     1
1.     1
2.     2
3.     6.      3! correspond à 3 * 2 * 1 = 6
4.     24.     4! correspond à 4 * 3 * 2 * 1 = 24
5.     120
6.     720
7.     5040
8.     40320

*)

type 'a stream = Cons of 'a * 'a stream Lazy.t

let factorials = 
  let rec factorial_sequence n acc = 
    Cons (acc, lazy (factorial_sequence (n+1) (acc*(n+1))))
  in 
  factorial_sequence 0 1 

let rec take n (Cons (x, xs)) =
  if n <= 0 then []
  else x :: take (n - 1) (Lazy.force xs)
  
let result1 = take 8 factorials;;
let result2 = take 10 factorials;;

Printf.printf "take 8 factorials -> [%s]\n" (String.concat "; " (List.map string_of_int result1));;
Printf.printf "take 10 factorials -> [%s]\n" (String.concat "; " (List.map string_of_int result2));;