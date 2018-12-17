// Classe partie

fileprivate class Partie {
    var xMax : Int //largeur
    var yMax : Int //longueur
    var player1 : Joueur
    var player2 : Joueur
    // Est ce qu'on ferait pas un système de tour ?
    // On calculerait le joueur courant et le joueur adverse en fonction de :
    // idRand et du nombre de tours
    // var currentPlayer : Joueur //A revoir
    // var passivePlayer : Joueur //A revoir
    var idRand : Int
    var nbTour : Int // meilleur idée

    // Constructeur
    init(_ nom1: String, _ nom2: String, _ largeur: Int, _ longueur: Int) {
      self.xMax = largeur
      self.yMax = longueur
      self.player1 = new Joueur(nom1)
      self.player2 = new Joueur(nom2)
      self.idRand = Int.random(in : 1...2)
    }

    // getter xMax
    func getLargeur() -> Int {
      return self.xMax
    }
    // getter yMax
    func getLongueur() -> Int {
      return self.yMax
    }
    // getter currentPlayer
    func getJoueurCourant() -> Joueur {
      return self.currentPlayer
    }
    // getter passivePlayer
    func getJoueurAdverse() -> Joueur {
      return self.passivePlayer
    }

    // renvoie le premier joueur de la partie
    func getJoueur1() -> Joueur {
      if idRand == 1 {
        return self.player1
      } else {
        return self.player2
      }
    }

    func setJoueurCourant(_ joueur : Joueur)-> Self {
      self.currentPlayer = joueur
      return self
    }

    func setJoueurAdverse(_ joueur : Joueur)-> Self {
      self.passivePlayer = joueur
      return self
    }

    func changerJoueur() -> Self {}

    // Renvoie sous forme de string les choix possibles
    func toStringChoix() -> String {
      var availableChoice : String
      if self.toStringPiecesDispoDeplacement() != "" {
        availableChoice += "1 : Déplacer"
      }
      if self.toStringPiecesDispoCapture() != "" {
        availableChoice += "2 : Capturer \n"
      }
      if !self.getJoueurCourant().reserveVide() {
        availableChoice += "3 : Parachuter\n"
      }
      return availableChoice
    }

    func toStringPlateau() -> String {}

    func toStringPiecesDispoDeplacement() -> String {}

    func toStringPiecesDispoCapture() -> String {}

    func toStringPiecesDispoParachutage() -> String {}

    func selectionnerPiecePlateau(_ num: Int, _ choix: String) throws -> Piece

    func selectionnerPieceReserve(_ num: Int, _ choix: String) throws -> Piece

    func toStringPossibiliteesDeplacement(_ piece: Piece)-> String

    func toStringPossibiliteesCapture(_ piece: Piece)-> String

    func toStringPossibiliteesParachuter(_ piece: Piece)-> String

    func verifierChoix(_ c1: int, _ c2: String) -> Bool

    func verifierCaseAutorisee(_ position: Int) -> Bool

    func caseVide(_ position: Int) throws -> Bool

    func casePromotion(_ position : Int)  throws -> Bool

    func caseEnnemi(_ position: Int) throws-> Bool

    func aPortee(_ position: Int, _ piece : Piece) throws -> Bool

    func verifierFinDuJeu() -> Bool

    func echecEtMat() -> Bool

    func possibiliteDeplacementRoi(_ piece: Piece) throws -> Bool

    func etrePieceCapturable(piece: Piece) -> Bool

    func piece1capturePiece2(_ piece1: Piece,_ piece2: Piece) -> Bool

    mutating func envoyerReserve(_ piece: Piece, _ joueur: Joueur) throws

    mutating func capturer(_ piece: Piece, _ position: Int) throws

    mutating func parachuter(_ piece: Piece, _ position : Int) throws

    mutating func deplacer(_ piece: Piece, _ position: Int) throws

    func pieceSurCase(_ position: Int) throws -> Piece

    func captureAutorisee(_ piece: Piece, _ position: Int) throws -> Bool

    func deplacementAutorise(_ piece: Piece, _ position: Int) throws -> Bool


}
