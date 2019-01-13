import Foundation

public class CollectionPiece {

    typealias ItCollectionPiece = IteratorProtocol

    var collection : [Piece]

    init() {
        // No action
    } // End func init

    func ajouterCollectionPiece(_ piece: Piece) {
        self.collection.append(piece)
    } // End func ajouterCollectionPiece

    func retirerCollectionPiece(toRem: Piece) throws {
        var i = 0
        for piece in self.collection {
            if toRem.getNomPiece() == piece.getNomPiece() {
                self.collection.remove(at : i)
                return
            } else {
                i += 1
            }
        }
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
        for piece in self.collection {
            if (piece.getNomPiece() == nom) {
                return piece
            }
        }
    } // End func getPieceCollectionPiece

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
            if let addPos = piece.getPosition() {
                toString += String(addPos)
            } else {
                toString += "NO POSITION"
            }
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

    /////////////////////
    // Ajout de notre groupe :
    // Il manque la fonction getCollectionPiece
    // Retourne la collection de piece
    // func getCollectionPiece : CollectionPiece-> [Piece]
    func getCollectionPiece() -> [Piece] {
        return self.collection
    } // End func getCollectionPiece
}


public struct ItCollectionPiece : IteratorProtocol{

    typealias ItCollectionPiece = CollectionPieceProtocol

    private let collection : CollectionPiece
    private var courant : Int = 0
    private let pieces : [Piece]

    init(_ c : CollectionPiece){
        self.collection = c
        self.pieces = self.collection.getCollectionPiece()
    } // End func init

    mutating public func next() -> Piece? {
        guard self.courant < self.pieces.count else {
            return nil
        }
        let val = self.courant
        self.courant += 1
        return self.pieces[val]
    } // End func next
}
