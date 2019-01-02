fileprivate class CollectionPiece {

    typealias ItCollectionPiece = IteratorProtocol
    var collection = [Piece]

    init() {
        // No action
    }

    public struct ItCollectionPiece : IteratorProtocol{

        typealias ItCollectionPiece = IteratorProtocol

        private let collection : CollectionPiece
        private var courant : Int = 0

        fileprivate init(_c : CollectionPiece){
            self.CollectionPiece = c
        }

        public func next() -> Piece? {
            guard self.courant < self.collection.count else { return nil }
            let val = self.courant
            self.courant = self.courant + 1
            return self.collection[val]
        }
    }


    func ajouterCollectionPiece(_ piece: Piece) -> Self {
         self.collection.append(piece)
     }

     func retirerCollectionPiece(piece: Piece) throws -> Self {
         self.collection.remove(piece)
     }

     Renvoie la piece identifie par son nom et sa position sur le plateau de jeu
     est contenue contenue dans la collection de pieces.
     Renvoie une erreur si la piece n'est pas dans la collection ou que la position
     entree n'est pas valide.

     - Precondition:
       - La piece a retirer appartient a la collection de piece.
       - la position entree est une position du plateau de jeu.

     func getPieceCollectionPiece(_ nom: String,_ position: Int) throws -> Piece {
       /*
       guard let nomValid = where else {
           show("piece non presente dans collection")
       }
       guard let positionValid = where else {
           show("mauvaise position")
       }
       */
       for piece in self {
             if piece.getNomPiece() == nom && piece.getPosition() {
               return piece
             }
       }
     }

     // ajout sinon impossible de travailler dessus
     private func getCollectionPiece() throws -> Piece {
         return self.collection
     }

     func EstDansCollectionPiece(_ nom: String, _ position: Int) -> Bool {
         for piece in self.collection {
             if piece.getNomPiece() == nom {
                 if piece.getPosition() == position  {
                     return true
                 }
             }
         }
         return false
     }

     func toStringCollectionPiece() -> String {
         var toString : String
         for piece in self.collection {
             toString += piece.getNomPiece()
             toString += " en "
             toString += piece.getPosition()
             toString += ", "
         }
         return toString
     }

     func nbPieceCollectionPiece() -> Int {
         return self.collection.count
     }

     func makeItCollectionPiece() -> ItCollectionPiece {
         return new ItCollectionPiece(self)
     }

}
