import Foundation

//Classe Joueur
//Done
class Joueur : JoueurProtocol {
    var namePlayer : String
    var collectionPiece : CollectionPiece
    var reserve : Reserve

    // Constructeur de Joueur
    required init(_ nom : String) {
        self.namePlayer = nom
        self.collectionPiece = CollectionPiece() //import collectionPieceClass
        self.reserve = Reserve() //import reserveClass
    } // End func init

    // getter Reserve
    public func getReserve() -> Reserve {
        return self.reserve
    } // End func getReserve

    // getter Nom Joueur
    public func getNomJoueur() -> String {
        return self.namePlayer
    } // End func getNomJoueur

    // getter CollectionPiece
    public func getCollectionPieceJoueur() -> CollectionPiece {
        return self.collectionPiece
    } // End func getCollectionPieceJoueur
}
