(* 
En OCaml, la construction try ... with sert à gérer les exceptions. 
Elle permet d’intercepter une erreur survenue lors de l’exécution d’un bloc de code, 
pour y répondre sans que le programme ne plante.
*)

(* 
try évalue l’expression principale.
with intercepte une exception levée pendant l'exécution.
Chaque branche | ExceptionType -> ... correspond à un pattern de correspondance avec le type d’exception.

try
  expression_a_executer
with
| ExceptionType1 -> expression_si_exception1
| ExceptionType2 -> expression_si_exception2
| _ -> expression_par_defaut
*)

let safe_div a b =
  try
    a / b
  with
  | Division_by_zero -> 0

(* Exemple avec Failure et argument *)
  let parse_int s =
  try
    int_of_string s
  with
  | Failure msg -> Printf.printf "Erreur : %s\n" msg; -1


  (*
| Exception          | Levée quand...                          |
| ------------------ | --------------------------------------- |
| `Division_by_zero` | Division entière par zéro               |
| `Failure`          | Fonction échoue (`int_of_string`, etc.) |
| `Not_found`        | Élément absent dans une recherche       |
| `Invalid_argument` | Argument invalide                       |
| `Match_failure`    | Pattern matching incomplet              |


✅ Utiliser try...with localement (proche du code susceptible d’échouer)
✅ Cibler précisément les exceptions à intercepter
✅ Prévoir une clause _ (joker) uniquement si nécessaire
❌ Ne pas masquer les bugs silencieusement avec with _ -> ... sauf intention explicite
  *)