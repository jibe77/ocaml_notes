(*
Le tri topologique est une opération fondamentale sur les graphes, particulièrement 
utile pour ordonner des tâches qui ont des dépendances entre elles.

Un tri topologique d'un graphe est une linéarisation des sommets de ce graphe telle que, 
pour toute arête dirigée allant d'un sommet U à un sommet V (notée U→V), 
le sommet U apparaît toujours avant le sommet V dans l'ordre de tri.

Conditions essentielles :

  Graphe dirigé : 
      Le tri topologique s'applique uniquement aux graphes dirigés (où les arêtes ont un sens).

  Graphe acyclique : 
      Il est impératif que le graphe ne contienne aucun cycle 
      (Directed Acyclic Graph - DAG). Si un cycle existe, il est impossible de réaliser 
      un tri topologique, car il y aurait toujours un sommet qui dépendrait d'un 
      sommet qui dépend de lui-même.

Algorithme de Kahn (Basé sur le degré entrant)

  Cet algorithme est souvent le plus intuitif à comprendre. Il repose sur l'idée de trouver des sommets qui n'ont aucune dépendance (degré entrant nul) et de les traiter en premier.
  Degré entrant (in-degree) : Le nombre d'arêtes qui pointent vers un sommet.

Étapes de l'algorithme de Kahn :

  Calculer les degrés entrants : Pour chaque sommet du graphe, calculez son degré entrant.

  Initialiser une file (queue) : Ajoutez à la file tous les sommets dont le degré entrant est égal à 0. Ces sommets peuvent être les premiers dans l'ordre topologique.

  Construire l'ordre topologique :

  Tant que la file n'est pas vide :

  Déqualifier un sommet U de la file et l'ajouter à la liste de l'ordre topologique.

  Pour chaque voisin V de U (c'est-à-dire pour chaque arête U→V) :

  Décrémenter le degré entrant de V de 1.

  Si le degré entrant de V devient 0, ajouter V à la file.

  Vérifier les cycles : Si le nombre de sommets dans la liste de l'ordre topologique est inférieur au nombre total de sommets dans le graphe, cela signifie qu'un cycle existe et qu'un tri topologique n'est pas possible.

% ocaml task_ordering.ml 
4 a sample this is
4
this is
is sample
is a 
a sample
thisisasample

*)

type vertex = {
    name: string;
    mutable neighbors : string list;
    mutable in_degree : int;
}
 
type graph = vertex list

(* Function to find a valid topological ordering *)
let topological_sort graph =
    let result = ref [] in
    let q = Queue.create() in

    List.iter (fun v ->
     if v.in_degree = 0 then
      Queue.add v q
      ) graph;

    while not (Queue.is_empty q) do
     let u = Queue.pop q in
     result := u.name :: !result;

     List.iter (fun v_name ->
      match List.find_opt (fun v -> v.name = v_name) graph with
       | Some v ->
          v.in_degree <- v.in_degree - 1;
          if v.in_degree = 0 then
           Queue.add v q
       | None -> ()
       ) u.neighbors;

    done;

    if List.length !result = List.length graph then
     List.rev !result
    else
     []

(* Main *)
let () =
    let n, names = Scanf.scanf "%d %[^\n]\n" (fun n names -> (n,names)) in
    let names = String.split_on_char ' ' names in

    let graph = List.map (fun name -> {name; neighbors=[]; in_degree=0}) names in

    let m = Scanf.scanf "%d\n" (fun m -> m) in

    for _ = 1 to m do
     let x,y = Scanf.scanf "%s %s\n" (fun x y -> (x,y)) in
     match List.find_opt (fun v -> v.name = x) graph,List.find_opt (fun v -> v.name = y) graph with
     | Some vx, Some vy ->
       vx.neighbors <- vy.name :: vx.neighbors;
       vy.in_degree <- vy.in_degree + 1
     | _ -> ()
    done;

    let result = topological_sort graph in
    match result with
    | [] -> Printf.printf "NO VALID ORDERING\n"
    | _ -> Printf.printf "%s\n" (String.concat "" result)






