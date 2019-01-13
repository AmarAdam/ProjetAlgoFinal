import Foundation

// Classe partie

public class Partie : PartieProtocol {
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
    case invalidPiece //piece entrée invalide (kodama samurai / roi) => possibiliteDeplacementRoi, envoyerReserve
    case invalidPlayer //piece n'appartenant pas au bon joueur
    case caseHorsPlateau //mauvaise case => CaseVide, pieceSurCase
    case invalidCase //case en parametre ne respecte pas les preconditions => pieceSurCase, caseEnnemi/Promotion
    case notRightChoice //=> selectionnerPiecePlateau
    case notInRightPlace //piece en parametre, pas au bon endroit
    case positionNotNull //position non nulle => envoyerReserve
    }

    // Constructeur
    required init(_ nom1: String, _ nom2: String, _ largeur: Int, _ longueur: Int) {
        self.xMax = largeur
        self.yMax = longueur
        self.idRand = Int.random(in : 1...2)
        self.nbTour = 0
        if self.idRand == 1 {
            self.player1 = Joueur(nom1)
            self.player2 = Joueur(nom2)
        } else {
            self.player1 = Joueur(nom2)
            self.player2 = Joueur(nom1)
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
    } // End func init

    // getter xMax
    func getLargeur() -> Int {
        return self.xMax
    } // End func getLargeur

    // getter yMax
    func getLongueur() -> Int {
        return self.yMax
    } // End func getLongueur

    // getter currentPlayer
    func getJoueurCourant() -> Joueur {
        return self.currentPlayer
    } // End func getJoueurCourant

    // getter passivePlayer
    func getJoueurAdverse() -> Joueur {
        return self.passivePlayer
    } // End func getJoueurAdverse

    // renvoie le premier joueur de la partie
    func getJoueur1() -> Joueur {
        if idRand == 1 {
            return self.player1
        } else {
            return self.player2
        }
    } // End func getJoueur1

    func setJoueurCourant(_ joueur : Joueur) {
        self.currentPlayer = joueur
    } // End func setJoueurCourant

    func setJoueurAdverse(_ joueur : Joueur) {
        self.passivePlayer = joueur
    } // End func setJoueurAdverse

    func changerJoueur() {
        let tempJoueur = self.getJoueurCourant()
        self.setJoueurCourant(self.getJoueurAdverse())
        self.setJoueurAdverse(tempJoueur)
        self.nbTour = 0
    } // End func changerJoueur

    // Renvoie sous forme de string les choix possibles
    func toStringChoix() -> String {
        var availableChoice : String
        if self.toStringPiecesDispoDeplacement() != "" {
            availableChoice = availableChoice + "1 : Déplacer \n"
        }
        if self.toStringPiecesDispoCapture() != "" {
            availableChoice = availableChoice + "2 : Capturer \n"
        }
        if !self.getJoueurCourant().getReserve().reserveVide() {
            availableChoice = availableChoice + "3 : Parachuter\n"
        }
        return availableChoice
    } // End func toStringChoix

    func toStringPlateau() -> String {
        var toString : String
        let piecesJ1 = getJoueur1().getCollectionPieceJoueur().toStringCollectionPiece()
        let piecesJ2 = getJoueur2().getCollectionPieceJoueur().toStringCollectionPiece()
        toString = toString + "Joueur 1 : "
        toString = toString + piecesJ1
        toString = toString + " Joueur 2 : "
        toString = toString + piecesJ2
        return toString
    } // End func toStringPlateau

    func toStringPiecesDispoDeplacement() -> String {
        let toString : String
        let collection = self.getJoueurCourant().getCollectionPieceJoueur().getCollectionPiece()
        var it = 0
        var  itLine = 1
        for collectionPiece in collection {
            toString = String(itLine)
            toString = toString + " - "
            toString = toString + collectionPiece.getNomPiece()
            toString = toString + " : "
            while it <= 11 {
                let aPortee = try self.aPortee(it, collectionPiece)
                if (self.caseVide(it) && aPortee){
                    toString = toString + String(it)
                    toString = toString + " ,"
                }
                it = it + 1
            }
            toString = toString + "\n"
            itLine = itLine + 1
        }
        return toString
    } // End func toStringPiecesDispoDeplacement

    func toStringPiecesDispoCapture() -> String {
        let collection = self.getJoueurCourant().getCollectionPieceJoueur().getCollectionPiece()
        var toString : String
        var it = 0
        var itLine = 1
        for collectionPiece in collection {
            toString = toString + String(itLine)
            toString = toString + " - "
            toString = toString + collectionPiece.getNomPiece()
            toString = toString + " : "
            while it<=11 {
                let aPortee = try self.aPortee(it, collectionPiece)
                if (self.caseEnnemi(it) && aPortee){
                    toString = toString + String(it)
                    toString = toString + " ,"
                }
                it = it + 1
            }
            toString = toString + "\n"
            itLine = itLine + 1
        }
        return toString
    } // End func toStringPiecesDispoCapture

    func toStringPiecesDispoParachutage() -> String {
        let reserve = self.getJoueurCourant().getReserve()
        var toString : String
        var itLine = 1
        for reservePiece in reserve {
            toString = toString + String(itLine)
            toString = toString + " - "
            toString = toString + reservePiece.getNomPiece()
            toString = toString + "\n"
            itLine = itLine + 1
        }
        return toString
    } // End func toStringPiecesDispoParachutage

    func selectionnerPiecePlateau(_ num: Int, _ choix: String) throws -> Piece {
        let name = getPieceNameFromString(num,choix)

        //Error Handling
        if (name == "") {
           throw GestionErrorPartie.notRightChoice
        }

        return self.getJoueurCourant().getCollectionPieceJoueur().getPieceCollectionPiece(name) // Il faut la position en param ...
    } // End func selectionnerPiecePlateau

    func selectionnerPieceReserve(_ num: Int, _ choix: String) throws -> Piece {
        //Error Handling
        let name = getPieceNameFromString(num, choix)
        let piece = try self.getJoueurCourant().getReserve().getPieceReserve(name)
        if (name == "") {
            throw GestionErrorPartie.notRightChoice
        }
        if (piece == nil) {
            throw GestionErrorPartie.notInRightPlace
        }
        return piece
    } // End func selectionnerPieceReserve

    func toStringPossibiliteesDeplacement(_ piece: Piece)-> String {
        var stringPossible = ""
        for position in getAllPosition() {
            let deplacementAutorise = try deplacementAutorise(piece, position)
            if deplacementAutorise {
                stringPossible = stringPossible + String(position)
                stringPossible = stringPossible + " "
            }
        }
        return stringPossible
    } // End func toStringPossibiliteesDeplacement

    func toStringPossibiliteesCapture(_ piece: Piece)-> String {
        var stringPossible = ""
        for position in getAllPosition() {
            try captureAutorisee(piece, position) {
                stringPossible = stringPossible + String(position)
                stringPossible = stringPossible + " "
            }
        }
        return stringPossible
    } // End func toStringPossibiliteesCapture

    func toStringPossibiliteesParachuter(_ piece: Piece)-> String {
        var stringPossible = ""
        for position in getAllPosition() {
            try parachutageAutorise(piece, position) {
                stringPossible = stringPossible + String(position)
                stringPossible = stringPossible + " "
            }
        }
        return stringPossible
    } // End func toStringPossibiliteesParachuter

    func verifierChoix(_ c1: Int, _ c2: String) -> Bool {
        // Sépare tout les mots de la String et les stoque dans un tableau
        tabWord = c2.components(separatedBy : " ")
        // Compare chaque mot du tableau tout juste créé avec le mot recherché
        for word in tabWord {
            if c1 == word {
                return true
            }
        }
        // Si le mot n'est pas trouvé, il renvoie false
        return false
    } // End func verifierChoix

    func verifierCaseAutorisee(_ position: Int) -> Bool {
        // La position doit être supérieur ou égal à 0
        let cond1 : Bool = (position >= 0)
        // La position doit être inferieur à la position maximum possible
        let cond2 : Bool = (position <= (self.getLongueur(position) * self.getLargeur(position) - 1))
        // Resultat : True si les 2 conditions respectés
        return (cond1 && cond2)
    } // End func verifierCaseAutorisee

    func caseVide(_ position: Int) throws -> Bool {
        //Error Handling
        if (position == nil) {
            throw GestionErrorPartie.caseHorsPlateau
        }
        if (position < 0) || (position > 11) {
            throw GestionErrorPartie.caseHorsPlateau
        }

        // Verification des pieces du joueur actif
        let collectionPiece = self.getJoueurCourant().getCollectionPieceJoueur().getCollectionPiece()
        for piece in  collectionPiece{
            if (piece.getPosition() == position) {
                return false
            }
        }
        // Verification des pieces du joueur passif
        for piece in self.getJoueurAdverse().getCollectionPieceJoueur().getCollectionPiece() {
            if (piece.getPosition() == position) {
                return false
            }
        }
        // Si la position n'est pas trouvé, la case est vide
        return true
    } // End func caseVide

    // J'ai préféré calculer celui ci même si le jeu n'est pas evolutif.
    func casePromotion(_ position : Int)  throws -> Bool {
      //Error Handling
      if (position < 0) || (position > 11) {
          throw GestionErrorPartie.invalidCase
      }

        // ligne J1
        let cond1 = (position >= 0)
        let cond2 = (position <= self.getLargeur(position) - 1)
        // Ligne J2
        let cond3 = (position >= self.getLargeur(position)*(self.getLongueur(position) - 1))
        let cond4 = (position <= self.getLargeur(position)*self.getLongueur(position))
        // Resultat
        let cond5 : Bool = (cond1 && cond2)
        let cond6 : Bool = (cond3 && cond4)
        return  (cond5 || cond6)
    } // End func casePromotion


    func caseEnnemi(_ position: Int) throws-> Bool {
        //Error Handling
        if (position < 0) || (position > 11) {
            throw GestionErrorPartie.invalidCase
        }

        // Verification des pieces du joueur ennemi
        let collectionPiece = self.getJoueurAdverse().getCollectionPieceJoueur().getCollectionPiece()
        for piece in collectionPiece {
            if piece.getPosition() == position {
                return true
            }
        }
        // Si la position n'est pas trouvé, la case es soit vide, soit apparetenant au joueur courant
        return false
    } // End func caseEnnemi

    // Partie Amjad

    //True si la position est à portée de la piece
    func aPortee(_ position: Int, _ piece : Piece) throws -> Bool {
        //Pour cette fonction, on fera une verification au cas par cas
        //Pre : La position entrée est contenue dans le plateau

        //Error Handling
        if (position < 0) || (position > 11) {
            throw GestionErrorPartie.invalidCase
        }

        let estJoueur1 : Bool = (self.getJoueurCourant().getNomJoueur() == self.getJoueur1().getNomJoueur())
        if let testPos = piece.getPosition() && estJoueur1 { // Joueur 1
            let gauche = posPiece==2 || posPiece==5 || posPiece==8 || posPiece==11
            let centre = posPiece==1 || posPiece==4 || posPiece==7 || posPiece==10
            let droite = posPiece==0 || posPiece==3 || posPiece==6 || posPiece==9

            switch piece.getNomPiece() {
            case "kodama":
                return (pos==posPiece+3) //ok
            case "kodama samurai":
                if droite {
                    return (pos==posPiece-3 || pos==posPiece+1 || pos==posPiece+3 || pos==posPiece+4)
                } else if centre {
                    return ( pos==posPiece-3 || pos==posPiece-1 || pos==posPiece+1 || pos==posPiece+2 || pos==posPiece+3 || pos==posPiece+4)
                } else if gauche {
                    return ( pos==posPiece-3 || pos==posPiece-1 || pos==posPiece+2 || pos==posPiece+3)
                } else {
                    return false
                } //ok
            case "tanuki":
                if droite {
                    return (pos==posPiece-3 || pos==posPiece+1 || pos==posPiece+3)
                } else if centre {
                    return ( pos==posPiece-3 || pos==posPiece-1 || pos==posPiece+1 || pos==posPiece+3)
                } else if gauche {
                    return ( pos==posPiece-3 || pos==posPiece-1 || pos==posPiece+3)
                } else {
                    return false
                } //ok
            case "kitsune":
                if droite {
                    return (pos==posPiece-2 || pos==posPiece+4)
                } else if centre {
                    return (pos==posPiece-4 || pos==posPiece-2 || pos==posPiece+2 || pos==posPiece+4)
                } else if gauche {
                    return (pos==posPiece-4 || pos==posPiece+2)
                } else {
                    return false
                } //ok
            case "koropokkuru":
                if droite {
                    return (pos==posPiece-3 || pos==posPiece-2 || pos==posPiece+1 || pos==posPiece+3 || pos==posPiece+4)
                } else if centre {
                    return (pos==posPiece-4 || pos==posPiece-3 || pos==posPiece-2 || pos==posPiece-1 || pos==posPiece+1 || pos==posPiece+2 || pos==posPiece+3 || pos==posPiece+4)
                } else if gauche {
                    return (pos==posPiece-3 || pos==posPiece+2 || pos==posPiece-1 || pos==posPiece+3 || pos==posPiece-4)
                } else {
                    return false
                } //ok
            default:
                return false
            }
        } else { // Joueur2
            let droite = posPiece==2 || posPiece==5 || posPiece==8 || posPiece==11
            let centre = posPiece==1 || posPiece==4 || posPiece==7 || posPiece==10
            let gauche = posPiece==0 || posPiece==3 || posPiece==6 || posPiece==9

            switch piece.getNomPiece() {
            case "kodama": //ok
                return (pos==posPiece-3)
            case "kodama samurai": //ok
                if droite {
                  return (pos==posPiece-4 || pos==posPiece-3 || pos==posPiece-1 || pos==posPiece+3)
                } else if centre {
                  return ( pos==posPiece-4 || pos==posPiece-3 || pos==posPiece-2 || pos==posPiece-1 || pos==posPiece+1 || pos==posPiece+3)
                } else if gauche {
                  return ( pos==posPiece-3 || pos==posPiece-2 || pos==posPiece+1 || pos==posPiece+3)
                } else {
                  return false
                }
            case "tanuki": //ok
                if droite {
                    return (pos==posPiece-3 || pos==posPiece-1 || pos==posPiece+3)
                } else if centre {
                    return ( pos==posPiece-3 || pos==posPiece-1 || pos==posPiece+1 || pos==posPiece+3)
                } else if gauche {
                    return ( pos==posPiece-3 || pos==posPiece+1 || pos==posPiece+3)
                } else {
                    return false
                }
            case "kitsune": //ok
                if droite {
                    return (pos==posPiece+2 || pos==posPiece-4)
                } else if centre {
                    return (pos==posPiece-4 || pos==posPiece-2 || pos==posPiece+2 || pos==posPiece+4)
                } else if gauche {
                    return (pos==posPiece+4 || pos==posPiece-2)
                } else {
                    return false
                }
            case "koropokkuru":
                if gauche {
                    return (pos==posPiece-3 || pos==posPiece-2 || pos==posPiece+1 || pos==posPiece+3 || pos==posPiece+4)
                } else if centre {
                    return (pos==posPiece-4 || pos==posPiece-3 || pos==posPiece-2 || pos==posPiece-1 || pos==posPiece+1 || pos==posPiece+2 || pos==posPiece+3 || pos==posPiece+4)
                } else if droite {
                    return (pos==posPiece-3 || pos==posPiece+2 || pos==posPiece-1 || pos==posPiece+3 || pos==posPiece-4)
                } else {
                    return false
                } //ok
            default:
                return false
            }
        }
    } // End func aPortee

    //True si l'un des deux joueurs a perdu
    func verifierFinDuJeu() -> Bool {
        //On récupère un booléen verifiant le cas ou le roi a passé la zone de promotion
        let posKing = self.getJoueurCourant().getCollectionPieceJoueur().getPieceCollectionPiece("koropokkuru")
        let checkKing = (self.possibiliteDeplacementRoi() && self.casePromotion(posKing))
        if self.echecEtMat() || checkKing {
            return true
        } else {
            return false
        }
    } // End func verifierFinDuJeu

    //True si l'un des deux joueurs a été mis en échec et mat
    func echecEtMat() -> Bool {
        let captureRoiAdverse = self.etrePieceCapturable(getJoueurAdverse().getCollectionPieceJoueur().getPieceCollectionPiece("koropokkuru"))
        let deplacementRoiAdverse = self.possibiliteDeplacementRoi(getJoueurAdverse().getCollectionPieceJoueur().getPieceCollectionPiece("koropokkuru"))
        if !deplacementRoiAdverse && captureRoiAdverse { //voir si c'est suffisant ou non pour echec et mat
            return true
        } else {
            return false
        }
    } // End func echecEtMat

    //True si le roi peut se déplacer (et uniquement se déplacer)
    func possibiliteDeplacementRoi(_ piece: Piece) throws -> Bool {

        // Error Handling
        if (!piece.estRoi()) {
           throw GestionErrorPartie.invalidPiece
        }

        let roi = piece
        var res : Bool = false
        var i = 0
        while (i<=11 || res) {
            let cond1 = try self.aPortee(i, roi)
            let cond2 = try self.caseVide(i))
            if (cond1 && cond2) {
                res = true
            }
            i = i + 1
        }
        return res
    } // End func possibiliteDeplacementRoi

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
    } // End func etrePieceCapturable

    //True si la piece1 peut capturer la piece2
    func piece1capturePiece2(_ piece1: Piece,_ piece2: Piece) -> Bool {
        let nom1 = piece1.getNomPiece()
        let position1 = piece1.getPosition() ?? -10 // Position à -10 si elle est nulle (ca ne devrait pas arriver, cf. la spé)

        let nom2 = piece2.getNomPiece()
        let position2 = piece2.getPosition() ?? -10 // Position à -10 si elle est nulle (ca ne devrait pas arriver, cf. la spé)

        let preTest11 = try self.caseVide(position1)
        let preTest12 = try self.caseVide(position2)
        let preTest21 = try self.caseEnnemi(position1)
        let preTest22 = try self.caseEnnemi(position2)
        let preTest3 = self.getJoueurCourant().getCollectionPieceJoueur().EstDansCollectionPiece(nom1, position1) && self.getJoueurCourant().getCollectionPieceJoueur().EstDansCollectionPiece(nom2, position2)

        if (preTest11 || preTest12) { // Une des 2 cases est vide
            return false
        } else if (preTest21 && preTest22) { // Les 2 pieces appartiennent à l'adversaire
            return false
        } else if (preTest3) {
            return false
        } else {
            return self.aPortee(piece1, position2)
        }
    } // End func piece1capturePiece2

    //Done (throws/catch a reprendre)
    func envoyerReserve(_ piece: Piece, _ joueur: Joueur) throws {

        let pos = piece.getPosition()
        let name = piece.getNomPiece()

        //Error Handling
        if (pos != nil) {
            throw GestionErrorPartie.positionNotNull
        }
        if (name == "kodama samurai") {
            throw GestionErrorPartie.invalidPiece
        }

        joueur.getReserve().ajouterReserve(piece)
    } // End func envoyerReserve

    //Fonction de capture d'une piece sur la case "position"
    func capturer(_ piece: Piece, _ position: Int) throws {

        //Error Handling
        do {
            let caseEnnemi = try self.caseEnnemi(position)
            let captureAutorise = try self.captureAutorisee(piece, position)
            let pieceCapturee = try self.pieceSurCase(position)
        } catch GestionErrorPartie.invalidCase {
            print("Vous ne pouvez pas capturer sur la case en parametre")
        } catch GestionErrorPartie.caseHorsPlateau {
            print("Case en dehors du plateau")
        }

        if  captureAutorise {
            switch pieceCapturee.getNomPiece() {
                case "kodama samurai":
                    try self.pieceSurCase(position).transformerEnKodama()
                    try self.pieceSurCase(position).setPosition(nil) //ce setter n'existe pas, il n'a pas été spécifié dans le type Piece...
                    try self.getJoueurAdverse().getCollectionPieceJoueur().retirerCollectionPiece(pieceCapturee) //on retire la piece du plateau
                    try self.getJoueurCourant().getReserve().ajouterReserve(pieceCapturee) //on ajoute la piece a la reserve
                    try piece.setPosition(pieceCapturee.getPosition())
                case "koropokkuru":
                    print("le roi a ete capture !\nle joueur adverse a perdu !\n")
                    //On agit comme si on avait fait une capture simple
                    //On vérifiera dans la fin du jeu si le koropokkuru est dans la reserve
                    try self.pieceSurCase(position).setPosition(nil)
                    try self.getJoueurAdverse().getCollectionPieceJoueur().retirerCollectionPiece(pieceCapturee)
                    try self.getJoueurCourant().getReserve().ajouterReserve(pieceCapturee)
                    //Puis on fait rien d'autre, on fera les tests nécessaire dans la fin du jeu
                default:
                    try self.pieceSurCase(position).setPosition(nil) //ce setter n'existe pas, il n'a pas été spécifié dans le type Piece...
                    try self.getJoueurAdverse().getCollectionPieceJoueur().retirerCollectionPiece(pieceCapturee) //on retire la piece du plateau
                    try self.getJoueurCourant().getReserve().ajouterReserve(pieceCapturee) //on ajoute la piece a la reserve
                    let positionCapture = pieceCapturee.getPosition()
                    piece.setPosition(positionCapture)
                }
            } else {
            print("capture impossible")
        }
    } // End func capturer

    //Fonction de parachutage d'une piece sur la case "position"
    func parachuter(_ piece: Piece, _ position : Int) throws {

        //Error Handling
        do {
            let caseVide = try self.caseVide(position)
            let estDansReserve = try self.getJoueurCourant().getReserve().EstDansReserve(piece.getNomPiece())
        } catch GestionErrorPartie.caseHorsPlateau {
            print("position non valide")
        } catch {
            print("reserve ne contient pas cette piece")
        }
        self.getJoueurCourant().getReserve().enleverReserve(piece)
        piece.setPosition(position) //attention, cette fonction n'existe pas.....
        self.getJoueurCourant().getCollectionPieceJoueur().ajouterCollectionPiece(piece)
        //(On a pas besoin de traiter le cas du kodama, on le parachute normalement, sans appeler la fonction de promotion)
    } // End func parachuter

    //Fonction de déplacement d'une piece à une case "position"
    func deplacer(_ piece: Piece, _ position: Int) throws {
        do {
            let caseVide = try self.caseVide(position)
            let deplacementAutorise = try self.deplacementAutorise(piece, position)

            if deplacementAutorise {
                piece.setPosition(position)
                let casePromotion = try casePromotion(position)
                if piece.estKodama() && casePromotion {
                    try piece.transformerEnKodamaSamurai()
                }
            }
        } catch GestionErrorPartie.caseHorsPlateau {
            print("Case en dehors du plateau")
        } catch GestionErrorPartie.invalidCase {
            print("Case invalide")
        } catch {
            print("Promotion impossible")
        }


    } // End func deplacer

    //Renvoie la piece presente sur la case en parametre
    func pieceSurCase(_ position: Int) throws -> Piece {
        //Error Handling
        if self.caseVide(position) {
            throw GestionErrorPartie.invalidCase
        }
        if (position == nil) {
            throw GestionErrorPartie.caseHorsPlateau
        }

        let collectionJoueur = self.getJoueurCourant().getCollectionPieceJoueur().getCollectionPiece()
        let collectionAdverse = self.getJoueurAdverse().getCollectionPieceJoueur().getCollectionPiece()
        let res : Piece
        for collectionPieceJ in collectionJoueur {
            if collectionPieceJ.getPosition() == position {
                res = collectionPieceJ
            }
        }
        for collectionPieceA in collectionAdverse {
            if collectionPieceA.getPosition() == position {
                res = collectionPieceA
            }
        }
        return res
    } // End func pieceSurCase

    //Verifie que la capture est possible
    //le roi peut etre capturé (c'est un choix, on verifiera s'il a été capturé dans une fonction testant la fin du jeu)
    func captureAutorisee(_ piece: Piece, _ position: Int?) throws -> Bool {

        do {
            let aPortee = try self.aPortee(position, piece)
            let caseNotEmpty = try !self.caseVide(position)
            return (aPortee && caseNotEmpty)

        } catch GestionErrorPartie.invalidCase {
            print("Case Invalide")

        } catch GestionErrorPartie.caseHorsPlateau {
            print("La case entree n'est pas contenue dans le plateau")

        }

    } // End func

    //Verifie que le deplacement de la piece est autorisee sur la case en parametre
    func deplacementAutorise(_ piece: Piece, _ position: Int) throws -> Bool {

        do {
            let aPortee = try self.aPortee(position, piece)
            let caseEmpty = try self.caseVide(position)
            return (aPortee && caseEmpty)

        } catch GestionErrorPartie.invalidCase {
            print("Case Invalide")

        } catch GestionErrorPartie.caseHorsPlateau {
            print("La case entree n'est pas contenue dans le plateau")

        }

    } // End func deplacementAutorise





    /////////////////////
    // Ajout de notre groupe :
    // Il manque la fonction parachutage autorisé
    // Verifie que le parachutage est autorisé
    // Le parachutage est autorisé si :
    //  - Aucune piece alliée ou ennemi n'est positionné sur la case donnée en paramètre
    //  - La position est existante sur le plateau
    func parachutageAutorise(_ position: Int) throws -> Bool {  // pourquoi prendre une Piece en paramètre ?
        guard (position != -10) else {
            print("position invalide")
            return false
        }
        if position >= 0 && position < self.xMax*self.yMax {
            let caseVide = try self.caseVide(position)
            return caseVide
        }
        return false
    } // End func parachutageAutorise

    // Fonction d'interface : permet d'afficher differents choix possibles
    private func getPieceNameFromString(_ num: Int, _ choix: String) -> String? {
        let tabChoice = choix.components(separatedBy : "\n")
        for choice in tabChoice {
            if choice.components(separatedBy : " - ")[0] == String(num) {
                return choice.components(separatedBy : " - ")[1]
            }
        }
        return ""
    } // End func getPieceNameFromString

    // renvoie un tableau contenant toute les positions du plateau sous forme de tableau
    private func getAllPosition() -> [Int] {
        var positions : [Int]
        let nbCase = self.xMax * self.yMax - 1
        for i in 0 ... nbCase {
            positions.append(i)
        }
        return positions
    } // End func getAllPosition

    // renvoie le deuxieme joueur de la partie
    private func getJoueur2() -> Joueur {
        if idRand == 1 {
            return self.player2
        } else {
            return self.player1
        }
    } // End func getJoueur1
}
