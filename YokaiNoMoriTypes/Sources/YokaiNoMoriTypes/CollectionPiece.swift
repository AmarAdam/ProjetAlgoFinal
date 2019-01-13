import Foundation

public class CollectionPiece {

    typealias ItCollectionPiece = IteratorProtocol

    var collection = [Piece]

    init() {
        // No action
    } // End func init

    func ajouterCollectionPiece(_ piece: Piece) {
        self.collection.append(piece)
        return self
    } // End func ajouterCollectionPiece

    func retirerCollectionPiece(piece: Piece) throws {
        for piece in self.collection {
            if piece.getNomPiece() == piece.getNomPiece() {
                self.collection.remove(piece)
                break
            }
        }
        return self
    } // End func retirerCollectionPiece

    /*
    Renvoie la piece identifie par son nom et sa position sur le plateau de jeu
    est contenue contenue dans la collection de pieces.
    Renvoie une erreur si la piece n'est pas dans la collection ou que la position
    entree n'est pas valide.

    - Precondition:
        - La piece a retirer appartient a la collection de piece.
        - la position entree est une position du plateau de jeu.
    */

    func getPieceCollectionPiece(_ nom: String,_ position: Int) throws -> Piece {
        /*
        guard let nomValid = where else {
            show("piece non presente dans collection")
        }
        guard let positionValid = where else {
            show("mauvaise position")
        }
        */
        for piece in self.collection {
            if piece.getNomPiece() == nom && piece.getPosition() {
                return piece
            }
        }
    } // End func getPieceCollectionPiece

    // ajout sinon impossible de travailler dessus
    func getCollectionPiece() throws -> Piece {
        return self.collection
    } // End func getCollectionPiece

    func EstDansCollectionPiece(_ nom: String, _ position: Int) -> Bool {
        for piece in self.collection {
            if piece.getNomPiece() == nom {
                if piece.getPosition() == position  {
                    return true
                }
            }
        }
        return false
    } // End func EstDansCollectionPiece

     func toStringCollectionPiece() -> String {
         var toString : String
         for piece in self.collection {
             toString += piece.getNomPiece()
             toString += " en "
             toString += piece.getPosition()
             toString += ", "
         }
         return toString
     } // End func toStringCollectionPiece

     func nbPieceCollectionPiece() -> Int {
         return self.collection.count
     } // End func nbPieceCollectionPiece

     func makeItCollectionPiece() -> ItCollectionPiece {
         return ItCollectionPiece(self)
     } // End func makeItCollectionPiece
}


public struct ItCollectionPiece : IteratorProtocol{

    typealias ItCollectionPiece = CollectionPieceProtocol

    private let collection : CollectionPiece
    private var courant : Int = 0
    private let pieces : [Piece]

    init(_ c : CollectionPiece){
        self.CollectionPiece = c
        self.pieces = self.CollectionPiece.collection
    } // End func init

    public func next() -> Piece? {
        guard self.courant < self.collection.count else { return nil }
        let val = self.courant
        self.courant = self.courant + 1
        return self.collection[val]
    } // End func next
}
