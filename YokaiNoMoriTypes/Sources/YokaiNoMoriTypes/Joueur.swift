import Foundation

//Classe Joueur
//Done
public class Joueur : JoueurProtocol {
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
    func getReserve() -> Reserve {
        return self.reserve
    } // End func getReserve

    // getter Nom Joueur
    func getNomJoueur() -> String {
        return self.namePlayer
    } // End func getNomJoueur

    // getter CollectionPiece
    func getCollectionPieceJoueur() -> CollectionPiece {
        return self.collectionPiece
    } // End func getCollectionPieceJoueur
}
