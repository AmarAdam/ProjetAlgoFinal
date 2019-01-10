import Foundation

public class Reserve : ReserveProtocol{
    var pieces : [Piece]
    var itReserve : ItReserve

    init(){
      self.pieces = []
    }

    func ajouterReserve(_ piece: Piece) throws -> Self {
        self.pieces.append(piece)
    }


    func enleverReserve(toRem: Piece) throws -> Self {
        var i = 0
        var iRem = -1
        for (piece, pieces) {
            if (piece.getNomPiece() == toRem.getNomPiece()) {
                iRem = i
            }
            i++
        }
        if (iRem != -1) {
            self.pieces.remove(at : i)
        }
    }

    func reserveVide() -> Bool {
        return self.pieces.isEmpty
    }

    func toStringReserve() -> String {
        var toString : String
        for piece in self.pieces {
            toString += piece.getNomPiece()
            toString += ", "
        }
        return toString
    }

    func getPieceReserve(_ nom: String) throws -> Piece {
        for piece in self.pieces {
            if piece.getNomPiece() == nom {
                return piece
            }
        }
        // return nil ??
        // need -> Piece?
    }


    // Ajouté par notre groupe
    func getPiecesReserve() -> [Piece] {
        return self.pieces
    }
    // Fin d'ajout

    func EstDansReserve(_ nom: String) throws -> Bool {
        for piece in self.pieces {
            if piece.getNomPiece() == nom {
                return true
            }
        }
        return false
    }

    func nbPieceReserve() -> Int {
        return self.pieces.count
    }

    public func makeIterator() -> ItReserve {
        return ItReserve(self)
    }
}


public struct ItReserve : IteratorProtocol{

    private let reserve : Reserve
    private var courant : Int = 0
    private let collection : [Piece]

    fileprivate init(_ r : Reserve){
        self.reserve = r
        self.collection = self.reserve.getPiecesReserve()
    }

    mutating public func next() -> Piece? {

        guard self.courant < self.collection.count else { return nil }

        let val = self.courant
        self.courant += 1

        return self.collection[val]
    }

    mutating public func reinitialiser() {
        self.courant = 0
    }
}
