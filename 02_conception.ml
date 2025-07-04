(*
🔍 Différence de philosophie
Paradigme	        Philosophie	État / variables
Impératif (Java)	Donner des instructions : "fais ceci, puis cela"	On modifie des variables (état mutable)
Fonctionnel (OCaml)	Exprimer des transformations de données	Pas de variables modifiées (état immuable), on crée des nouvelles valeurs

📝 Résumé des différences

Aspect	Java (impératif)	OCaml (fonctionnel)
Variables	mutables (somme modifiée)	immutables (on calcule une nouvelle valeur)
Contrôle de flux	boucle for	fonction d’ordre supérieur (fold_left)
Pensée	"comment le faire, étape par étape"	"quelle transformation je veux appliquer aux données"


C’est un exemple simple mais très représentatif car en impératif on fait une boucle, et en fonctionnel on "plie" la liste.

public class Main {
    public static void main(String[] args) {
        int[] liste = {1, 2, 3, 4, 5};
        int somme = 0;

        for (int i = 0; i < liste.length; i++) {
            somme = somme + liste[i];
        }

        System.out.println("Somme = " + somme);
    }
}

Version fonctionnelle avec List.fold_left : 
*)
let liste = [1; 2; 3; 4; 5]

let somme = List.fold_left (fun acc x -> acc + x) 0 liste

let () = Printf.printf "Somme = %d\n" somme
