let rec factorielle n =
  if n <= 1 then 1
  else n * factorielle (n - 1);;

(* Appel *)
let res = factorielle 5;;
print_int res;;
