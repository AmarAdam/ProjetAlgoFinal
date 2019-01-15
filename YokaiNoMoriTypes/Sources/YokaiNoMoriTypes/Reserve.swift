import Foundation

public class Reserve : ReserveProtocol {
    var pieces : [Piece]
    //var itReserve : ItReserve

    // Si l'init ne fait rien pourquoi le demander ?
    required public init(){
        self.pieces = []
        //self.itReserve = ItReserve(self)
      // Do Nothing
    } // End func init

    func ajouterReserve(_ piece: Piece) throws {
        self.pieces.append(piece)
    } // End func ajouterReserve

    func enleverReserve(_ piece: Piece) throws {
        var i = 0
        var iRem = -1
        for itPiece in self.pieces {
            if (itPiece.getNomPiece() == piece.getNomPiece()) {
                iRem = i
            }
            i = i + 1        }
        if (iRem != -1) {
            self.pieces.remove(at : i)
        }
    } // End func enleverReserve

    func reserveVide() -> Bool {
        return self.pieces.isEmpty
    } // End func reserveVide

    func toStringReserve() -> String {
        var toString : String = ""
        for piece in self.pieces {
            toString += piece.getNomPiece()
            toString += ", "
        }
        return toString
    } // End func toStringReserve

    // La fonction devrait renvoyer Une piece ou null si elle n'existe pas
    //func getPieceReserve(_ nom: String) throws -> Piece? {
    func getPieceReserve(_ nom : String) throws -> Piece? {
        var pieceTrouve : Piece?
        var b : Bool = false
        for piece in self.pieces {
            if piece.getNomPiece() == nom {
                pieceTrouve = piece
                b = true
            }
        }
        if b {
            return pieceTrouve
        }
        else {
            return nil
        }
        
    } // End func getPieceReserve

    // Ajouté par notre groupe
    func getPiecesReserve() -> [Piece] {
        return self.pieces
    } // End func getPiecesReserve
    // Fin d'ajout

    func EstDansReserve(_ nom: String) throws -> Bool {
        for piece in self.pieces {
            if piece.getNomPiece() == nom {
                return true
            }
        }
        return false
    } // End func EstDansReserve

    func nbPieceReserve() -> Int {
        return self.pieces.count
    } // End func nbPieceReserve

    public func makeIterator() -> ItReserve {
        return ItReserve(self)
    } // End func makeIterator
}


public struct ItReserve : IteratorProtocol{

    private let reserve : Reserve
    private var courant : Int = 0
    private let collection : [Piece]

    fileprivate init(_ r : Reserve){
        self.reserve = r
        self.collection = self.reserve.getPiecesReserve()
    } // End func init

    mutating public func next() -> Piece? {

        guard self.courant < self.collection.count else { return nil }

        let val = self.courant
        self.courant += 1

        return self.collection[val]
    } // End func next

    mutating public func reinitialiser() {
        self.courant = 0
    } // End func reinitialiser
}
