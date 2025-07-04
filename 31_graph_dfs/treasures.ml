(*
Le DFS (pour Depth-First Search, ou parcours en profondeur) est un algorithme de parcours de graphe. 
C’est l’un des deux grands types de parcours classiques, avec le BFS 
(Breadth-First Search, ou parcours en largeur).

Le DFS explore le plus loin possible un chemin avant de revenir en arrière.
Autrement dit, on suit un chemin en profondeur jusqu’à ne plus pouvoir avancer, 
puis on recule (backtrack) pour explorer d’autres chemins.

Étapes du DFS :
* On part d’un sommet de départ.
* On marque ce sommet comme visité.
* Pour chaque voisin non visité, on applique récursivement le DFS.
* Quand on ne peut plus avancer, on remonte dans l’arbre d’appel et on continue avec les autres voisins non visités.

Exemple visuel simple
Pour ce graphe :


A - B - D
|   |
C   E

DFS à partir de A pourrait donner :

A → B → D → E → C

ou

A → C → B → E → D
(selon l’ordre dans la liste d’adjacence)

Pour lancer le programme, on procède de cette façon en spécifiant à la première ligne la taille du tableau,
puis à fin du tableau le point de départ.
X indique un passage bloqué, et "t" indique l'emplacement d'un trésor : 

% ocaml treasures.ml
4 10
..t...X...
.....X..t.
XXXXX.X...
.......X.t
4 1
Cela retourne "no" car on ne peut pas récupérer de trésor.

% ocaml treasures.ml
7 6
..t...
..XXX.
......
tX..X.
.X..Xt
.XX...
..t...
5 3
Cela retourne "yes" car on peut récupérer un trésor.


% ocaml treasures.ml
4 10
..t...X...
.....X..t.
XXXXX.X...
.......X.t
4 1
Cela retourne "no" car on ne peut pas récupérer de trésor.

5 7
.......
.XXXXXt
.X...Xt
.X.X.XX
...X.Xt
5 5
Cela retourne "yes" car on peut récupérer un trésor.

*)

let dfs_map grid visited r c =
    let rows = Array.length grid in
    let cols = Array.length grid.(0) in
    let dr = [|-1; 1; 0; 0|] in
    let dc = [|0; 0; 1; -1|] in

    let rec dfs x y =
    if x = r && y = c then
        ()
    else
        visited.(x).(y) <- true;

    (* Explore the map *)
    for i = 0 to 3 do
        let nx = x + dr.(i) in
        let ny = y + dc.(i) in
        if nx >= 0 && nx < rows && ny >= 0 && ny < cols && grid.(nx).(ny) <> 'X' && not visited.(nx).(ny) then
            dfs nx ny
        done
    in

    dfs r c



let can_reach_treasure grid r c =
    let rows = Array.length grid in
    let cols = Array.length grid.(0) in
    let visited = Array.make_matrix rows cols false in

    dfs_map grid visited r c;

    let found_treasure = ref false in
    for i = 0 to rows - 1 do
        for j = 0 to cols - 1 do
            if grid.(i).(j) = 't' && visited.(i).(j) then
                found_treasure := true
        done
    done;

    !found_treasure

(*  Main Program *)
let () =
    let n, m = Scanf.scanf "%d %d\n" (fun n m -> (n,m)) in
    let grid = Array.make_matrix n m '.' in

    for i = 0 to n - 1 do
        grid.(i) <- Scanf.scanf "%s\n" (fun row -> Array.of_seq (String.to_seq row));
    done;

    let r,c = Scanf.scanf "%d %d\n" (fun r c -> (r-1,c-1)) in


    if can_reach_treasure grid r c then
        Printf.printf "yes\n"
    else
        Printf.printf "no\n"
