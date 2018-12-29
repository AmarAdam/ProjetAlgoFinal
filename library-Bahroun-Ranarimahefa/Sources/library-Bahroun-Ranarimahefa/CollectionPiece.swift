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

     func getPieceCollectionPiece(_ nom: String) throws -> Piece {
         for piece in self.collection {
             if piece.getNomPiece() == nom {
                 return piece
             }
         }
         // return nil ??
         // need -> Piece?
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
         // TODO
     }

}
