import YokaiNoMoriTypes

//Classe Joueur
//Done
fileprivate class Joueur {
    var namePlayer : String
    var collectionPiece : CollectionPiece
    var reserve : Reserve

    // Constructeur de Joueur
    init(_ nom : String) {
      self.namePlayer = nom
      self.collectionPiece = CollectionPiece() //import collectionPieceClass
      self.reserve = Reserve() //import reserveClass
    }

    // getter Reserve
    func getReserve() -> Reserve {
      return self.reserve
    }

    // getter Nom Joueur
    func getNomJoueur() -> String {
      return self.namePlayer
    }

    // getter CollectionPiece
    func getCollectionPieceJoueur() -> CollectionPiece {
      return self.collectionPiece
    }
}
