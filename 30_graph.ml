type vertex = {
    id: int;
    neighbors: int list; (* List of adjacent vertices *)
}

type graph = vertex list

(* Create a new vertex with a given identifier *)
let create_vertex id = {id; neighbors = []}

(* Add a vertex to the graph *)
let add_vertex graph id =
    let new_vertex = create_vertex id in
    graph @ [new_vertex]

(* Add an edge between two vertices (undirected graph) *)
let add_edge graph id1 id2 =
    let rec add_neighbor v id neighbor_id =
        match v with
        | [] -> []
        | hd :: tl ->
          if hd.id = id then {hd with neighbors = neighbor_id :: hd.neighbors} :: tl
          else hd :: add_neighbor tl id neighbor_id
    in
    let updated_graph = add_neighbor graph id1 id2 in
    let updated_graph' = add_neighbor updated_graph id2 id1 in
    updated_graph'

(* Print the graph *)
let print_graph graph =
 List.iter (fun vertex ->
    Printf.printf "Vertex %d: " vertex.id;
    List.iter (fun neighbor -> Printf.printf "%d " neighbor) vertex.neighbors;
    print_endline ""
    ) graph

let my_graph =
    let graph = [] in
    let graph_with_vertices = add_vertex graph 1 in
    let graph_with_two_vertices = add_vertex graph_with_vertices 2 in
    let graph_with_three_vertices = add_vertex graph_with_two_vertices 3 in
    let final_graph = add_edge graph_with_three_vertices 1 2 in
    let final_graph' = add_edge final_graph 1 3 in
    final_graph' ;;

print_graph my_graph























