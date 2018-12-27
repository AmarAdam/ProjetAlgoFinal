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

    enum GestionErrorPartie : Error {
    case invalidNomPiece
    case caseHorsPlateau
    }

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
      self.getJoueur1().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("tanuki", 0))
      self.getJoueur1().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("koropokkuru", 1))
      self.getJoueur1().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("kitsune", 2))
      self.getJoueur1().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("kodama", 4))

      // pour le Joueur 2  le tanuki est placé sur la position 11,
      //le koropokkuru est placé sur la position 10,
      //le kitsune est placé sur la position 9
      //le kodama sur la position 7
      self.getJoueur2().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("tanuki", 11))
      self.getJoueur2().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("koropokkuru", 10))
      self.getJoueur2().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("kitsune", 9))
      self.getJoueur2().getCollectionPieceJoueur().ajouterCollectionPiece(Piece("kodama", 7))
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
        let tempJoueur = self.getJoueurCourant()
        self.setJoueurCourant(self.getJoueurAdverse)
        self.setJoueurAdverse(tempJoueur)
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

    //True si la position est à portée de la piece
    func aPortee(_ position: Int, _ piece : Piece) throws -> Bool {
      //Pour cette fonction, on fera une verification au cas par cas
      //Pre : La position entrée est contenue dans le plateau

      guard let pos = position where pos>=0 && pos <=11 else { //On verifie que la case choisie est bien sur le plateau
          show("Hors de portee")
      }

      let estJoueur1 : Bool = (self.getJoueurCourant==self.getJoueur1)
      if estJoueur1 { // Joueur 1
        let gauche = piece.getPosition()==2 || piece.getPosition()==5 || piece.getPosition()==8 || piece.getPosition()==11
        let centre = piece.getPosition()==1 || piece.getPosition()==4 || piece.getPosition()==7 || piece.getPosition()==10
        let droite = piece.getPosition()==0 || piece.getPosition()==3 || piece.getPosition()==6 || piece.getPosition()==9

        switch piece.getNomPiece() {
        case "kodama":
          return (pos==piece.getPosition()+3) //ok
        case "kodama samurai":
          if droite {
            return (pos==piece.getPosition()-3 || pos==piece.getPosition()+1 || pos==piece.getPosition()+3 || pos==piece.getPosition()+4)
          } else if centre {
            return ( pos==piece.getPosition()-3 || pos==piece.getPosition()-1 || pos==piece.getPosition()+1 || pos==piece.getPosition()+2 || pos==piece.getPosition()+3 || pos==piece.getPosition()+4)
          } else if gauche {
            return ( pos==piece.getPosition()-3 || pos==piece.getPosition()-1 || pos==piece.getPosition()+2 || pos==piece.getPosition()+3)
          } else {
            return false
          } //ok
        case "tanuki":
          if droite {
            return (pos==piece.getPosition()-3 || pos==piece.getPosition()+1 || pos==piece.getPosition()+3)
          } else if centre {
            return ( pos==piece.getPosition()-3 || pos==piece.getPosition()-1 || pos==piece.getPosition()+1 || pos==piece.getPosition()+3)
          } else if gauche {
            return ( pos==piece.getPosition()-3 || pos==piece.getPosition()-1 || pos==piece.getPosition()+3)
          } else {
            return false
          } //ok
        case "kitsune":
          if droite {
            return (pos==piece.getPosition()-2 || pos==piece.getPosition()+4)
          } else if centre {
            return (pos==piece.getPosition()-4 || pos==piece.getPosition()-2 || pos==piece.getPosition()+2 || pos==piece.getPosition()+4)
          } else if gauche {
            return (pos==piece.getPosition()-4 || pos==piece.getPosition()+2)
          } else {
            return false
          } //ok
        case "koropokkuru":
          if droite {
            return (pos==piece.getPosition()-3 || pos==piece.getPosition()-2 || pos==piece.getPosition()+1 || pos==piece.getPosition()+3 || pos==piece.getPosition()+4)
          } else if centre {
            return (pos==piece.getPosition()-4 || pos==piece.getPosition()-3 || pos==piece.getPosition()-2 || pos==piece.getPosition()-1 || pos==piece.getPosition()+1 || pos==piece.getPosition()+2 || pos==piece.getPosition()+3 || pos==piece.getPosition()+4)
          } else if gauche {
            return (pos==piece.getPosition()-3 || pos==piece.getPosition()+2 || pos==piece.getPosition()-1 || pos==piece.getPosition()+3 || pos==piece.getPosition()-4)
          } else {
            return false
          } //ok
        default:
          return false
        }
      }else { // Joueur2
        let droite = piece.getPosition()==2 || piece.getPosition()==5 || piece.getPosition()==8 || piece.getPosition()==11
        let centre = piece.getPosition()==1 || piece.getPosition()==4 || piece.getPosition()==7 || piece.getPosition()==10
        let gauche = piece.getPosition()==0 || piece.getPosition()==3 || piece.getPosition()==6 || piece.getPosition()==9

        switch piece.getNomPiece() {
        case "kodama": //ok
          return (pos==piece.getPosition()-3)
        case "kodama samurai": //ok
          if droite {
            return (pos==piece.getPosition()-4 || pos==piece.getPosition()-3 || pos==piece.getPosition()-1 || pos==piece.getPosition()+3)
          } else if centre {
            return ( pos==piece.getPosition()-4 || pos==piece.getPosition()-3 || pos==piece.getPosition()-2 || pos==piece.getPosition()-1 || pos==piece.getPosition()+1 || pos==piece.getPosition()+3)
          } else if gauche {
            return ( pos==piece.getPosition()-3 || pos==piece.getPosition()-2 || pos==piece.getPosition()+1 || pos==piece.getPosition()+3)
          } else {
            return false
          }
        case "tanuki": //ok
          if droite {
            return (pos==piece.getPosition()-3 || pos==piece.getPosition()-1 || pos==piece.getPosition()+3)
          } else if centre {
            return ( pos==piece.getPosition()-3 || pos==piece.getPosition()-1 || pos==piece.getPosition()+1 || pos==piece.getPosition()+3)
          } else if gauche {
            return ( pos==piece.getPosition()-3 || pos==piece.getPosition()+1 || pos==piece.getPosition()+3)
          } else {
            return false
          }
        case "kitsune": //ok
          if droite {
            return (pos==piece.getPosition()+2 || pos==piece.getPosition()-4)
          } else if centre {
            return (pos==piece.getPosition()-4 || pos==piece.getPosition()-2 || pos==piece.getPosition()+2 || pos==piece.getPosition()+4)
          } else if gauche {
            return (pos==piece.getPosition()+4 || pos==piece.getPosition()-2)
          } else {
            return false
          }
        case "koropokkuru":
          if gauche {
            return (pos==piece.getPosition()-3 || pos==piece.getPosition()-2 || pos==piece.getPosition()+1 || pos==piece.getPosition()+3 || pos==piece.getPosition()+4)
          } else if centre {
            return (pos==piece.getPosition()-4 || pos==piece.getPosition()-3 || pos==piece.getPosition()-2 || pos==piece.getPosition()-1 || pos==piece.getPosition()+1 || pos==piece.getPosition()+2 || pos==piece.getPosition()+3 || pos==piece.getPosition()+4)
          } else if droite {
            return (pos==piece.getPosition()-3 || pos==piece.getPosition()+2 || pos==piece.getPosition()-1 || pos==piece.getPosition()+3 || pos==piece.getPosition()-4)
          } else {
            return false
          } //ok
        default:
          return false
        }
      }
    }
    //True si l'un des deux joueurs a perdu
    func verifierFinDuJeu() -> Bool {
      //On récupère un booléen verifiant le cas ou le roi a passé la zone de promotion
      var posKing = self.getJoueurCourant().getCollectionPieceJoueur().getPieceCollectionPiece("koropokkuru")
      var checkKing = (self.possibiliteDeplacementRoi() && self.casePromotion(posKing))
      if self.echecEtMat() || checkKing {
        return true
      } else {
        return false
      }
    }
    //True si l'un des deux joueurs a été mis en échec et mat
    func echecEtMat() -> Bool {
      let captureRoiAdverse = self.etrePieceCapturable(getJoueurAdverse().getCollectionPieceJoueur().getPieceCollectionPiece("koropokkuru"))
      let deplacementRoiAdverse = self.possibiliteDeplacementRoi(getJoueurAdverse().getCollectionPieceJoueur().getPieceCollectionPiece("koropokkuru"))
      if !deplacementRoiAdverse && captureRoiAdverse { //voir si c'est suffisant ou non pour echec et mat
        return true
      } else {
        return false
      }
    }
    //True si le roi peut se déplacer (et uniquement se déplacer)
    func possibiliteDeplacementRoi(_ piece: Piece) throws -> Bool {
      guard let roi = piece where roi.estRoi() else {
          show("la piece en paramètre n'est pas un roi")
      }
      let res : Bool = false
      let i = 0
      while (i<=11 || res) {
        if (self.aPortee(i, roi) && self.caseVide(i)) {
          res = true
        }
        i += 1
      }
      return res
    }
    //True si la piece peut être capturée
    func etrePieceCapturable(piece: Piece) -> Bool {
      let result = false
      let collectionAdverse = passivePlayer.getCollectionPieceJoueur()
      for collectionPiece in collectionAdverse {
        if self.aPortee(piece.getPosition(),collectionPiece) {
          result = true
        }
      }
      return result
    }
    //True si la piece1 peut capturer la piece2
    func piece1capturePiece2(_ piece1: Piece,_ piece2: Piece) -> Bool {
      let nom1 = piece1.getNomPiece()
      let position1 = piece1.getPosition()

      let nom2 = piece2.getNomPiece()
      let position2 = piece2.getPosition()

      let preTest3 = self.getJoueurCourant().getCollectionPieceJoueur().EstDansCollectionPiece(nom1, position1)
                  && self.getJoueurCourant().getCollectionPieceJoueur().EstDansCollectionPiece(nom2, position2)

      if self.caseVide(position1) || self.caseVide(position2) { //une des 2 cases est vide
        return false
      } else if self.caseEnnemi(position1) && self.caseEnnemi(position2) { //les 2 pieces appartiennent à l'adversaire
        return false
      } else if preTest3 {
        return false
      } else {
        return self.aPortee(piece1, position2)
      }
    }
    //Done (throws/catch a reprendre)
    func envoyerReserve(_ piece: Piece, _ joueur: Joueur) throws {
      guard let pos = piece.getPosition() where pos==nil else{
        show("position de piece non vide")
      }
      //try catch ?? A verifier
      guard let name = piece.getNomPiece() where name!="kodama samurai" else{
        show("la piece est un kodama samurai")
      }
      joueur.getReserve().ajouterReserve(piece)
    }
    //Fonction de capture d'une piece sur la case "position"
    func capturer(_ piece: Piece, _ position: Int) throws {
      guard let positionValid = position //position valide, case appartient à l'ennemi
      where positionValid>=0 && positionValid <=11 && self.caseEnnemi(position)
      else {
          show("position invalide")
      }
      guard let pieceValid = piece //piece est bien présente dans la collection du joueur courant
      where pieceValid==self.getJoueurCourant().getCollectionPieceJoueur().EstDansCollectionPiece(piece.getNomPiece(),piece.getPosition())
      else {
          show("mauvaise piece passee en parametre")
      }

      if self.captureAutorisee(pieceValid, positionValid) {
        let pieceCapturee = self.pieceSurCase(positionValid)
        switch pieceCapturee.getNomPiece() {
        case "kodama samurai":
          self.pieceSurCase(positionValid).transformerEnKodama()
          self.pieceSurCase(positionValid).setPosition(nil) //ce setter n'existe pas, il n'a pas été spécifié dans le type Piece...
          self.getJoueurAdverse().getCollectionPieceJoueur().retirerCollectionPiece(pieceCapturee) //on retire la piece du plateau
          self.getJoueurCourant().getReserve().ajouterReserve(pieceCapturee) //on ajoute la piece a la reserve
          pieceValid.setPosition(pieceCapturee.getPosition())
        case "koropokkuru":
          print("le roi a ete capture !\nle joueur adverse a perdu !\n")
          //On agit comme si on avait fait une capture simple
          //On vérifiera dans la fin du jeu si le koropokkuru est dans la reserve
          self.pieceSurCase(positionValid).setPosition(nil)
          self.getJoueurAdverse().getCollectionPieceJoueur().retirerCollectionPiece(pieceCapturee)
          self.getJoueurCourant().getReserve().ajouterReserve(pieceCapturee)
          //Puis on fait rien d'autre, on fera les tests nécessaire dans la fin du jeu
        default:
          self.pieceSurCase(positionValid).setPosition(nil) //ce setter n'existe pas, il n'a pas été spécifié dans le type Piece...
          self.getJoueurAdverse().getCollectionPieceJoueur().retirerCollectionPiece(pieceCapturee) //on retire la piece du plateau
          self.getJoueurCourant().getReserve().ajouterReserve(pieceCapturee) //on ajoute la piece a la reserve
          piece.setPosition(pieceCapturee.getPosition())
        }
      } else {
        print("capture impossible")
      }
    }
    //Fonction de parachutage d'une piece sur la case "position"
    func parachuter(_ piece: Piece, _ position : Int) throws {
      guard let positionValid = position where self.caseVide(positionValid) && positionValid<=11 && positionValid >=0 else {
        show("position non valide")
      }
      guard let pieceValid = piece where self.getJoueurCourant().getReserve().EstDansReserve(pieceValid.getNomPiece()) && pieceValid.getPosition()==nil else {
        show("reserve ne contient pas cette piece")
      }
      self.getJoueurCourant().getReserve().enleverReserve(pieceValid)
      pieceValid.setPosition(position) //attention, cette fonction n'existe pas.....
      self.getJoueurCourant().getCollectionPieceJoueur().ajouterCollectionPiece(pieceValid)
      //(On a pas besoin de traiter le cas du kodama, on le parachute normalement, sans appeler la fonction de promotion)
    }
    //Fonction de déplacement d'une piece à une case "position"
    func deplacer(_ piece: Piece, _ position: Int) throws {
      guard positionValid = position where self.caseVide(positionValid) && positionValid<=11 && positionValid>=0 else {
          show("position invalide")
      }
      if self.deplacementAutorise(piece, positionValid) {
          piece.setPosition(positionValid)
          if pieceValid.estKodama && casePromotion(positionValid) {
              pieceValid.transformerEnKodamaSamurai()
          }
      }

    }
    //Renvoie la piece presente sur la case en parametre
    func pieceSurCase(_ position: Int) throws -> Piece {
      guard let positionValid=position
      where !self.caseVide(positionValid) else {
          show("position invalide")
      }
      let collectionJoueur = self.getJoueurCourant().getCollectionPieceJoueur()
      let collectionAdverse = self.getJoueurAdverse().getCollectionPieceJoueur()
      let res : Piece
      for collectionPieceJ in collectionJoueur {
        if collectionPieceJ.getPosition() == positionValid {
          res = collectionPieceJ
        }
      }
      for collectionPieceA in collectionAdverse {
        if collectionPieceA.getPosition() == positionValid {
          res = collectionPieceA
        }
      }
      return res
    }
    //Verifie que la capture est possible
    //le roi peut etre capturé (c'est un choix, on verifiera s'il a été capturé dans une fonction testant la fin du jeu)
    func captureAutorisee(_ piece: Piece, _ position: Int) throws -> Bool {
      guard let positionValid = position where positionValid<=11 && positionValid>=0 && !self.caseVide(positionValid) else {
          show("position non valide")
          return self.aPortee(positionValid, piece)
      }

    }
    //Verifie que le deplacement de la piece est autorisee sur la case en parametre
    func deplacementAutorise(_ piece: Piece, _ position: Int) throws -> Bool {
      guard let positionValid = position where positionValid<=11 && positionValid>=0 && self.caseVide(positionValid) else {
          show("position non valide")
      }
      return self.aPortee(positionValid, piece)
    }
    //Fonction d'interface : permet d'afficher differents choix possibles
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
