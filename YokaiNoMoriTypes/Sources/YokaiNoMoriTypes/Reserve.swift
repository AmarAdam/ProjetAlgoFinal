import Foundation

public class Reserve : ReserveProtocol{
    var reserve : TReserve?

    init(){
      self.reserve = nil
    }

    func ajouterReserve(_ piece: Piece) throws -> Self {
        self.reserve.append(piece)
    }

    func enleverReserve(piece: Piece) throws -> Self {
        self.reserve.remove(piece)
    }

    func reserveVide() -> Bool {
      self.return self.reserve.count == 0
    }

    func toStringreserve() -> String {
        var toString : String
        for piece in self.reserve {
            toString += piece.getNomPiece()
            toString += " en "
            toString += piece.getPosition()
            toString += ", "
        }
        return toString
    }

    func getPieceReserve(_ nom: String) throws -> Piece {
        for piece in self.reserve {
            if piece.getNomPiece() == nom {
                return piece
            }
        }
        // return nil ??
        // need -> Piece?
    }

    func estDansReserve(_ nom: String) throws -> Bool {
        for piece in self.reserve {
            if piece.getNomPiece() == nom {
                return true
            }
        }
        return false
    }

    func nbPieceReserve() -> Int {
        return self.reserve.count
    }

    func makeIterator() -> ItReserve {
        return ItReserve(self)
    }
}

public class TReserve {
    var piece : Piece
    var next : TReserve
    init(){
      self.piece = nil
      self.next = nil
    }
}

typealias Reserve = (TReserve | Reserve | nil)

public class ItReserve {
    var current : Piece
    var next : Reserve
}

public struct ItReserve : IteratorProtocol{

    typealias ItReserve = ReserveProtocol

    private let reserve : Reserve
    private var courant : Int = 0
    private let collection : [Piece]

    fileprivate init(_r : reserve){
        self.reserve = r
        self.collection = self.reserve.getPieces()  // à créer fonction getPieces afin de récupérer les pieces de la reserve
    }

        public func next() -> Piece? {

        guard self.courant < self.reserve.count

        else { return nil }

        let val = self.courant
        self.courant = self.courant + 1

        return self.collection[val]
    }
}
