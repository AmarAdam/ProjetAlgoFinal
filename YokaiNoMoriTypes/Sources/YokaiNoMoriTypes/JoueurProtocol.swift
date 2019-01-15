/**
  Le joueur possede un nom, une collection de Piece et une reserve.
  Ce protocol sera implemente par un type nomme Piece.

*/

protocol JoueurProtocol{

    associatedtype Reserve : ReserveProtocol
    associatedtype CollectionPiece : CollectionPieceProtocol

    /**
     Créer un joueur avec un nom, une collection de Piece vide et une reserve vide,
     la collection de pieces respectera les conditions du début de partie lorsqu'on initialiser la partie.

     creerJoueur : String -> Joueur

     - Postcondition:
      - le Joueur cree possede une collectionPiece vide.
      - le Joueur cree possede une Reserve vide.
      - le Joueur cree possede un nom.
     */
    init(_ nom : String)

    /**
     Renvoie la reserve du joueur

     getReserve : Joueur -> Reserve
     */
    func getReserve() -> Reserve

    /**
     Renvoie la valeur du nom du joueur

     getNomJoueur : Joueur -> String
     */
    func getNomJoueur() -> String

    /**
     récupère la CollectionPiece du joueur

     getCollectionPieceJoueur: Joueur -> CollectionPiece
     */
    func getCollectionPieceJoueur() -> CollectionPiece

}
