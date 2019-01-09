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
