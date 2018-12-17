// collection Reserve
// implementation avec liste
// implementation avec une tête

import Piece

fileprivate class Reserve {
    var reserve : TReserve?
    init(){
      self.reserve = nil
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

func creerReserve() -> Reserve {return nil}

func ajouterReserve(_ piece: Piece) throws -> Self {
}

func enleverReserve(piece: Piece) throws -> Self {

}

func reserveVide() -> Bool {
  return (self.piece == nil) // A revoir, on devrait implementer Reserve avec une tête
}

func toStringreserve() -> String {

}

func getPieceReserve(_ nom: String) throws -> Piece {

}

func estDansReserve(_ nom: String) throws -> Bool {

}

func nbPieceReserve() -> Int {

}

func makeItReserve() -> ItReserve {

}
