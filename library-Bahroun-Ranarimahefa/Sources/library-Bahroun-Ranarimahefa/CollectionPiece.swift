fileprivate class CollectionPiece {

/**
  Une collection de pieces contient les pieces du joueur présent sur le plateau
  de jeu et uniquement ceux la.
  Ce protocol sera implemente par un type nomme CollectionPiece.
*/

var collection = [Piece]()

/**
creee une collection de pieces vide
creerCollectionPiece: -> CollectionPiece

- Postcondition:
- nbPieceCollectionPiece(creerCollectionPiece()) == 0 
*/

  init( )
 
 /**
   Ajoute la piece en parametre a la collection de pieces.

   ajouterCollectionPiece: Piece x CollectionPiece -> CollectionPiece

   - Postcondition: la collection contient la piece ajoutee.
 */
 mutating func ajouterCollectionPiece(_ piece: Piece) -> Self

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
   est contenue contenue dans la collection de pieces.

   EstDansCollectionPiece: String x Int x CollectionPiece -> Piece
 */
 func EstDansCollectionPiece(_ nom: String, _ position: Int) -> Bool

 /**
   Renvoie une chaine de caractere contenant le nom des pieces de la collection
   separees par une virgule.

   toStringCollectionPiece: CollectionPiece -> String

   - Exemple: "koropokkuru, kitsune, tanuki"
 */
 func toStringCollectionPiece() -> String

 /**
   Renvoie le nombre de pieces de la collection de pieces.

   nbPieceCollectionPiece: CollectionPiece -> Int
 */
 func nbPieceCollectionPiece() -> Int
 
 /*
 *	cree un iterateur sur les pieces de la collection pour la parcourir 
 	makeItCollectionPiece : CollectionPiece -> ItCollectionPiece
 */
 func makeItCollectionPiece() -> ItCollectionPiece

}

}