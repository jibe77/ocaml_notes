(*
La méthode BFS (Breadth-First Search), ou parcours en largeur en français, 
est un algorithme essentiel pour explorer les nœuds et les arêtes d'un graphe. 

Contrairement au parcours en profondeur (DFS) qui explore le plus loin possible avant de revenir, 
le BFS explore le graphe niveau par niveau, en partant d'un nœud source donné. 

Imaginez que vous jetez une pierre dans un lac : 

les ondes se propagent uniformément vers l'extérieur ; c'est un peu le principe du BFS.

L'idée principale derrière le BFS est de visiter tous les voisins immédiats d'un nœud avant de passer à leurs propres voisins, et ainsi de suite. Pour ce faire, il utilise une file d'attente (queue).

Voici les étapes clés :

  Initialisation :

    Choisissez un nœud de départ (source).
    Marquez ce nœud de départ comme visité.
    Ajoutez ce nœud de départ à une file d'attente.

  Exploration :

    Tant que la file d'attente n'est pas vide :
    Défilez un nœud (retirez le premier élément de la file). C'est le nœud que vous êtes en train d'explorer.
    Pour chacun des voisins de ce nœud :

  Si le voisin n'a pas encore été visité :

    Marquez-le comme visité.
    Enfilez-le (ajoutez-le à la fin de la file d'attente).

Le code suivant permet de trouver le chemin le plus court entre le point de départ et un trésor.

% ocaml mindistances.ml
7 6
..t...
..XXX.
......
tX..X.
.X..Xt
.XX...
..t...
5 3
minimum distance: 4

% ocaml mindistances.ml
4 10
..t...X...
.....X..t.
XXXXX.X...
.......X.t
4 1
no treasure can be reached

5 7
.......
.XXXXXt
.X...Xt
.X.X.XX
...X.Xt
5 5
minimum distance: 19

*)

open Queue

(* Define a data structure to represent the map *)
type cell = Empty | Obstacle | Treasure

(* Define a function to check if a cell is valid and accessible *)
let is_valid grid visited x y =
    x >= 0 && x < Array.length grid &&
    y >= 0 && y < Array.length grid.(0) &&
    grid.(x).(y) <> Obstacle &&
    not visited.(x).(y)


(* Define the BFS algorithm to compute minimum distances *)
let bfs grid start_x start_y =
    let rows = Array.length grid in
    let cols = Array.length grid.(0) in

    (* Initialize visited matrix *)
    let visited = Array.make_matrix rows cols false in

    (* Initialize queue for BFS *)
    let q = Stdlib.Queue.create () in

    (* Initialize distances matrix *)
    let distances = Array.make_matrix rows cols max_int in

    distances.(start_x).(start_y) <- 0; (* Distance to starting position is 0 *)

    (* Directions: up, down, left, right *)
    let dr = [|-1; 1; 0; 0|] in
    let dc = [|0; 0; -1; 1|] in

    (* Begin BFS *)

    (* Enqueue the starting position *)
    Stdlib.Queue.push (start_x,start_y) q ;

    while not (Stdlib.Queue.is_empty q) do
        let (x,y) = Stdlib.Queue.pop q in

        (* Check neighboring cells *)
        for i = 0 to 3 do
            let nx = x + dr.(i) in
            let ny = y + dc.(i) in

            if is_valid grid visited nx ny then begin
                visited.(nx).(ny) <- true;
                distances.(nx).(ny) <- distances.(x).(y) + 1 ;
                Stdlib.Queue.push (nx,ny) q ;
            end
        done
    done;

    distances



(* Function to find the minimum distance to a treasure *)
let min_distance_to_treasure grid start_x start_y =
    let distances = bfs grid start_x start_y in
    let rows = Array.length distances in
    let cols = Array.length distances.(0) in

    let min_distance = ref max_int in

    (*Traverse Map looking for the minimum distance*)
    for i = 0 to rows-1 do
     for j = 0 to cols - 1 do
      if grid.(i).(j) == Treasure then
       min_distance := min !min_distance distances.(i).(j)
     done
    done;

    if !min_distance = max_int then
        None  (* No accessible treasure found *)
    else
        Some !min_distance (* minimum distance to the nearest treasure *)

(* Main Program *)
let () =
    let n,m = Scanf.scanf "%d %d\n" (fun n m -> (n,m)) in
    let grid = Array.make_matrix n m Empty in

    (* Read the map *)
    for i = 0 to n-1 do
     let row = Scanf.scanf "%s\n" (fun row -> row) in
     for j = 0 to m-1 do
        match row.[j] with
        | '.' -> grid.(i).(j) <- Empty
        | 't' -> grid.(i).(j) <- Treasure
        | _ -> grid.(i).(j) <- Obstacle
     done
    done;

    let r,c = Scanf.scanf "%d %d\n" (fun r c ->(r-1,c-1)) in

    match min_distance_to_treasure grid r c with
     | Some distance -> Printf.printf "minimum distance: %d\n" distance
     | None -> Printf.printf "no treasure can be reached\n"





