public struct ItCollectionPiece : IteratorProtocol{

    typealias ItCollectionPiece = CollectionPieceProtocol

    private let collection : CollectionPiece
    private var courant : Int = 0
    private let pieces : [Piece]

    fileprivate init(_c : CollectionPiece){
        self.CollectionPiece = c
        self.pieces = self.CollectionPiece.collection
    }

    public func next() -> Piece? {
        guard self.courant < self.collection.count else { return nil }
        let val = self.courant
        self.courant = self.courant + 1
        return self.collection[val]
    }
}
