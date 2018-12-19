// Classe partie

fileprivate class Partie {
    var xMax : Int //largeur
    var yMax : Int //longueur
    var player1 : Joueur
    var player2 : Joueur
    // Est ce qu'on ferait pas un système de tour ?
    // On calculerait le joueur courant et le joueur adverse en fonction de :
    // idRand et du nombre de tours
    var currentPlayer : Joueur //A revoir
    var passivePlayer : Joueur //A revoir
    
    var idRand : Int
    var nbTour : Int

    // Constructeur
    init(_ nom1: String, _ nom2: String, _ largeur: Int, _ longueur: Int) {
      self.xMax = largeur
      self.yMax = longueur
      self.idRand = Int.random(in : 1...2)
      self.nbTour = 0
      if self.idRand == 1 {
          self.player1 = new Joueur(nom1)
          self.player2 = new Joueur(nom2)
      } else {
          self.player1 = new Joueur(nom2)
          self.player2 = new Joueur(nom1)
      }
      self.currentPlayer = self.player1
      self.passivePlayer = self.player2
  
      // pour le Joueur 1  le tanuki est placé sur la position 0, 
      //le koropokkuru est placé sur la position 1, 
      //le kitsune est placé sur la position 2
      //le kodama sur la position 4
      getJoueur1().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("tanuki", 0))
      getJoueur1().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("koropokkuru", 1))
      getJoueur1().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("kitsune", 2))
      getJoueur1().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("kodama", 4))
        
      // pour le Joueur 2  le tanuki est placé sur la position 11, 
      //le koropokkuru est placé sur la position 10, 
      //le kitsune est placé sur la position 9
      //le kodama sur la position 7
      getJoueur2().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("tanuki", 11))
      getJoueur2().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("koropokkuru", 10))
      getJoueur2().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("kitsune", 9))
      getJoueur2().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("kodama", 7))
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

    func changerJoueur() -> Self {
        let tempJoueur = getJoueurCourant()
        setJoueurCourant(getJoueurAdverse)
        setJoueurAdverse(tempJoueur)
        self.nbTour = 0
        return Self
    }

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

    func toStringPlateau() -> String {
        var toString : String
        let piecesJ1 = getJoueur1().getCollectionPieceJoueur().toStringCollectionPiece()
        let piecesJ2 = getJoueur2().getCollectionPieceJoueur().toStringCollectionPiece()
        toString +=  "Joueur 1 : "
        toString += piecesJ1
        toString += " Joueur 2 : "
        toString += piecesJ2
        return toString
    }

    func toStringPiecesDispoDeplacement() -> String {

    }

    func toStringPiecesDispoCapture() -> String {

    }

    func toStringPiecesDispoParachutage() -> String {

    }

    func selectionnerPiecePlateau(_ num: Int, _ choix: String) throws -> Piece {
      
    }

    func selectionnerPieceReserve(_ num: Int, _ choix: String) throws -> Piece {

    }

    func toStringPossibiliteesDeplacement(_ piece: Piece)-> String {

    }

    func toStringPossibiliteesCapture(_ piece: Piece)-> String {

    }

    func toStringPossibiliteesParachuter(_ piece: Piece)-> String {

    }

    func verifierChoix(_ c1: int, _ c2: String) -> Bool {

      tabWord = c2.components(separatedBy(" "))

      for word in tabWord {
        if c1 == word {
          return true
        }
      }

      return false

    }

    func verifierCaseAutorisee(_ position: Int) -> Bool {
      return position <= (self.getLongueur(position) * self.getLargeur(position) - 1)
    }

    func caseVide(_ position: Int) throws -> Bool {

    }

    // J'ai préféré calculer celui ci même si le jeu n'est pas evolutif.
    func casePromotion(_ position : Int)  throws -> Bool {
    return  (   position >= 0
            &&  position <= self.getLargeur(position) - 1 )
            ||
            (   position >= self.getLargeur(position)*(self.getLongueur(position)-1)
            &&  position <= self.getLargeur(position)*self.getLongueur(position) )
    }


    func caseEnnemi(_ position: Int) throws-> Bool {

    }

    // Partie Amjad
    func aPortee(_ position: Int, _ piece : Piece) throws -> Bool {

    }

    func verifierFinDuJeu() -> Bool {

    }

    func echecEtMat() -> Bool {

    }

    func possibiliteDeplacementRoi(_ piece: Piece) throws -> Bool {

    }

    func etrePieceCapturable(piece: Piece) -> Bool {

    }

    func piece1capturePiece2(_ piece1: Piece,_ piece2: Piece) -> Bool {

    }

    func envoyerReserve(_ piece: Piece, _ joueur: Joueur) throws {

    }

    func capturer(_ piece: Piece, _ position: Int) throws {

    }

    func parachuter(_ piece: Piece, _ position : Int) throws {

    }

    func deplacer(_ piece: Piece, _ position: Int) throws {

    }

    func pieceSurCase(_ position: Int) throws -> Piece {

    }

    func captureAutorisee(_ piece: Piece, _ position: Int) throws -> Bool {

    }

    func deplacementAutorise(_ piece: Piece, _ position: Int) throws -> Bool {

    }

    private func getPieceFromString(_ num: Int, _ choix: String) {
      let tabChoice = choix.components(separatedBy("\n"))
      for choice in tabChoice {
        if choice.components(separatedBy:" - ")[0] == String(num) {
          return choice.components(separatedBy:" - ")[1]
        }
      }
      return ""
    }

}
