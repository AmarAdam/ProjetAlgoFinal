import YokaiNoMoriTypes

fileprivate class Reserve : ReserveProtocol{
    var reserve : TReserve?

    init(){
      self.reserve = nil
    }

    func creerReserve() -> Reserve {
        return nil
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

fileprivate class TReserve {
    var piece : Piece
    var next : TReserve
    init(){
      self.piece = nil
      self.next = nil
    }
}
typealias Reserve = TReserve | Reserve | nil

fileprivate class ItReserve {
    var current : Piece
    var next : Reserve
}
