/**
  Une collection de pieces contient les pieces du joueur présent sur le plateau
  de jeu et uniquement ceux la.
  Ce protocol sera implemente par un type nomme CollectionPiece.
*/

import Foundation

protocol CollectionPieceProtocol : Sequence{
  associatedtype Piece : PieceProtocol
  associatedtype ItCollectionPiece : IteratorProtocol

 /**
   Creee une collection de pieces vide

   creerCollectionPiece: -> CollectionPiece

   - Postcondition:
    - nbPieceCollectionPiece(creerCollectionPiece()) == 0 .
 */
 init()

 /**
   Ajoute la piece en parametre a la collection de pieces.

   ajouterCollectionPiece: Piece x CollectionPiece -> CollectionPiece
    - Precondition: la piece en parametre est bien du type Piece
    - Postcondition: la collection contient la piece ajoutee.
 */
 mutating func ajouterCollectionPiece(_ piece: Piece) throws -> Self

 /**
    Retire la piece en parametre de la collection de pieces. Renvoie une erreur
    si la piece n'est pas dans la collection.

    retirerCollectionPiece: Piece x CollectionPiece -> CollectionPiece

    - Precondition: la piece a retirer appartient a la collection de pieces.
    - Postcondition: la collection ne contient plus la piece a retirer.
 */
 mutating func retirerCollectionPiece(piece: Piece) throws -> Self

 /**
    Renvoie la piece identifie par son nom et sa position sur le plateau de jeu
    est contenue contenue dans la collection de pieces.
    Renvoie une erreur si la piece n'est pas dans la collection ou que la position
    entree n'est pas valide.

    getPieceCollectionPiece: String x CollectionPiece -> Piece

    - Precondition:
      - La piece a retirer appartient a la collection de piece.
      - la position entree est une position du plateau de jeu.
 */
 func getPieceCollectionPiece(_ nom: String) throws -> Piece

 /**
   Renvoie Vrai si la piece identifie par son nom et sa position sur le plateau de jeu
   est contenue contenue dans la collection de pieces. Renvoie une erreur si la précondition
   n'est pas respectée.

   EstDansCollectionPiece: String x Int x CollectionPiece -> Bool

     - Precondition: la position entree est une position du plateau de jeu.
 */
 func EstDansCollectionPiece(_ nom: String, _ position: Int) throws -> Bool

 /**
   Renvoie une chaine de caractere contenant le nom des pieces de la collection
   separees et leur position par une virgule.

   toStringCollectionPiece: CollectionPiece -> String

   - Exemple: "koropokkuru en 1, kitsune en 0, tanuki en 2"
 */
 func toStringCollectionPiece() -> String

 /**
   Renvoie le nombre de pieces de la collection de pieces.

   nbPieceCollectionPiece: CollectionPiece -> Int
 */
 func nbPieceCollectionPiece() -> Int

 /**
 	 cree un iterateur sur les pieces de la collection pour la parcourir dans l'ordre
   croissant de leurs positions sur le plateau. C'est a dire si le kitsune est en
   position 0 et le roi en 1 alors l'iterateur devra parcourir le kitsune en premier,
   ensuite le roi et ainsi de suite.

 	 makeItCollectionPiece : CollectionPiece -> ItCollectionPiece
 */
 func makeItCollectionPiece() -> ItCollectionPiece

}
