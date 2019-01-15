/*
  Une partie se compose de deux joueurs.
  Les cases du plateau du jeu sont reperes par un numero allant de 0 au nombre
  maximal de cases du plateau de jeu ((longeur * largeur) - 1).
  La case n°0 du plateau de jeu est la case situe en haut a gauche et la derniere
  case en bas a droite du plateau de jeu. La zone de promotion du premier joueur correspond donc
  a la premiere ligne du plateau et donc aux position 0 au nombre de cases de la premiere ligne.
  De meme pour la zone de promotion du joueur 2 qui correspond a la derniere ligne du plateau de jeu.
  Ce protocol sera implemente par un type nomme Partie.
*/

protocol PartieProtocol {
  associatedtype Joueur: JoueurProtocol
  associatedtype Piece: PieceProtocol

  /**
   Cree une partie avec 2 joueurs, une reserve vide et leurs pieces disposees
   aux bons endroit sur le plateau de jeu.
   Le joueur qui commence est tiree aleatoirement.

   creerPartie: String x String x Int x Int -> Partie

   - Entree:
    - nom1: le nom du joueur 1.
    - nom2: le nom du joueur 2.
    - largeur: largeur du plateau de jeu.
    - longueur: longueur du plateau de jeu.
    - Precondition:
        -la longueur et la largeur entree sont strictement positives.
        -les joueurs ne peuvent pas avoir le meme nom.
    - Postcondition:
        -les pieces des deux joueurs sont disposees aux bons endroits et la reserve est creee
        - pour le Joueur 1  le tanuki est placé sur la position 0, le koropokkuru est placé sur la position 1, le kitsune est placé sur la position 2
        et le kodama sur la position 4
        - pour le Joueur 2  le tanuki est placé sur la position 11, le koropokkuru est placé sur la position 10, le kitsune est placé sur la position 9
        et le kodama sur la position 7
        - un joueur courant est attribué.
  */
  init(_ nom1: String, _ nom2: String, _ largeur: Int, _ longueur: Int)

  /**
    Retourne la largeur du plateau de jeu.

    getLargeur: Partie -> Int
  */
  func getLargeur() -> Int

  /**
   Retourne la longueur du plateau de jeu.

   getLongueur: Partie -> Int
  */
  func getLongueur() -> Int

  /** ------------------------------------ Gestion des joueurs ----------------------------------*/

  /**
   Retourne le joueur qui est en train de jouer.

   getJoueurCourant : Partie -> Joueur

   - Postcondition: getJoueurCourant(p) == setJoueurCourant(p,j)
  */
  func getJoueurCourant() -> Joueur

  /**
   Retourne le joueur adverse de celui qui est en train de jouer.

   getJoueurAdverse : Partie -> Joueur

   - Postcondition : getJoueurAdverse(p) == setJoueurAdverse(p,j)
  */
  func getJoueurAdverse() -> Joueur

  /**
   Retourne le premier joueur de la partie.

   getJoueur1: Partie -> Joueur
  */
  func getJoueur1() -> Joueur

  /**
   Change le joueur qui joue en celui passe en parametre.

   setJoueurCourant :  Partie x Joueur -> Partie

   - Entree: Le joueur qui doit jouer
   - Postcondition : getJoueurCourant(p) == setJoueurCourant(p,j)
  */
  mutating func setJoueurCourant(_ joueur : Joueur)

  /**
   Change le joueur adverse en celui passe en parametre.

   setJoueurAdverse: Partie x Joueur -> Partie

   - Entree: Le joueur adverse de celui qui doit jouer.
   - Postcondition : getJoueurAdverse(p) == setJoueurAdverse(p,j)
  */
  mutating func setJoueurAdverse(_ joueur : Joueur)

  /**
   Le joueur courant devient le joueur adverse et inversement.

   changerJoueur : Partie -> Partie
  */
  mutating func changerJoueur()

  /** ------------------------------------ Fonctions interface utilisateur ----------------------------------*/

  /**
    Renvoie une chaine de caractere contenant les actions disponibles (deplacer/capturer/parachuter)
    Si au moins une des cartes du joueur peut se deplacer on affiche le choix “deplacer”,
    si au moins une des cartes du joueur peut effectuer une capture on affiche le choix "capturer",
    si la reserve n’est pas vide on affiche le choix "parachuter".
    Au maximum il y a 3 choix, 1 : deplacer , 2 : capturer , 3 : parachuter

    toStringChoix: Partie -> String

    - Sortie: une chaine de caractere contenant les actions possibles a faire.
              Les choix possibles doivent être numerotes de 1 a 3 correspondant
              respectivement a deplacer, capturer et parachuter.
              Exemple : " - 1 : se deplacer
                          - 3 : parachuter "
  */
  func toStringChoix() -> String

  /**
   Renvoie une chaine de caractere contenant le plateau du jeu avec les pieces des
   deux joueurs sur ce plateau ainsi que leurs positions. Il faut être capable de
   differencier les pieces des deux joueurs.

   afficherPlateau: Partie -> String
  */
  func toStringPlateau() -> String

  /**
   Renvoie une chaine de caractere contenant le nom des pieces du joueur courant et leur position,
   capable de se deplacer et uniquement de se deplacer. Renvoie une chaine indiquant qu'aucune
   piece peut se deplacer le cas echeant.

   toStringPiecesDispoDeplacement : Partie -> String

   - Sortie : une chaine de caractere contenant les pieces du joueur courant pouvant
              se deplacer. Les pieces dans la chaine de caractere seront numerotes
              de 1 au nombre maximum de pieces pouvant se deplacer.
              Exemple: "1 - koropokkuru en 1
                        2 - komada en 4 "
  */
  func toStringPiecesDispoDeplacement() -> String

  /**
   Renvoie une chaine de caractere contenant les pieces du joueur courant capable
   d'effectuer une capture et uniquement une capture. Renvoie une chaine
   indiquant qu'aucune piece peut effectuer une capture le cas echeant.

   toStringPiecesDispoCapture : Partie -> String

   - Sortie : une chaine de caractere contenant les noms pieces du joueur courant pouvant
              effectuer une capture. Les pieces dans la chaine de caractere seront numerotes
              de 1 au nombre maximum de pieces pouvant effectuer une capture
              Exemple: "1 - koropokkuru en 1
                        2 - kitsune en 0"
  */
  func toStringPiecesDispoCapture() -> String

  /**
   Renvoie une chaine de caractere contenant les noms des pieces du joueur courant pouvant
   être parachute. Renvoie une chaine indiquant qu'aucune piece peut être parachuter.

   toStringPiecesDispoParachutage: Partie -> String

   - Sortie : une chaine de caractere contenant les pieces du joueur courant pouvant
              être parachute. Les pieces dans la chaine de caractere seront numerotes
              de 1 au nombre maximum de pieces pouvant être parachute.
              Exemple: "1 - koropokkuru
                        2 - tanuki "
  */
  func toStringPiecesDispoParachutage() -> String

  /**
    Renvoie la piece du plateau du joueur courant correspondant a la foix au numero du choix
    passee en parametre et au numero de la piece de la chaine de caractere.
    Renvoie une erreur si les precondition ne sont pas respecte.

    selectionnerPiecePlateau: Int x String x Partie -> Piece

    - Entree:
      - num: numero de la piece choisie
      - choix : chaine de caractere contenant les noms des pieces et un numero attribue a chaque piece.
    - Exemple: selectionnerPiece(1,"1 - koropokkuru \n2- tanuki") renvoie le koropokkuru du joueur sur le plateau
    - Precondition:
      - la piece selectionnee est sur le plateau et appartient au joueur courant.
      - le numero du choix entree est l'un de ceux contenu proposee par la chaine de caractere.
  */
  func selectionnerPiecePlateau(_ num: Int, _ choix: String) throws -> Piece
  /**
    Renvoie la piece de la reserve du joueur courant correspondant a la foix au numero du choix
    passee en parametre et au numero de la piece de la chaine de caractere.

    selectionnerPieceReserve: Int x String x Partie -> Piece

    - Entree:
      - num: numero de la piece choisie
      - choix : chaine de caractere contenant les noms des pieces et un numero attribue a chaque piece.
    - Exemple: selectionnerPiece(1,"1 - kodama \n2- tanuki") renvoie le kodama de la reserve
    - Precondition:
      - la piece selectionnee est dans la reserve du joueur courant.
      - le numero du choix entree est l'un de ceux proposee par la chaine de caractere.
  */
  func selectionnerPieceReserve(_ num: Int, _ choix: String) throws -> Piece

  /**
    Renvoie une chaine de caractere contenant les numeros des cases ou la piece
    en parametre peut se deplacer et uniquement se deplacer. Renvoie une chaine
    indiquant qu'aucune possibilite de deplacement n'est possible le cas echeant.
    Rappel: le roi ne peut pas se mettre en echec.

    toStringPossibiliteesDeplacement: Piece x Partie -> String
  */
  func toStringPossibiliteesDeplacement(_ piece: Piece)-> String

  /**
   Renvoie une chaine de caractere contenant les numeros des cases ou la piece
   en parametre peut effectuer une capture et uniquement une capture.
   Renvoie une chaine indiquant qu'aucune possibilite
   de capture n'est possible le cas echeant. Rappel: le roi ne peut pas se mettre en echec.

   toStringPossibiliteesCapture: Piece x Partie -> String
  */
  func toStringPossibiliteesCapture(_ piece: Piece)-> String

  /**
    Renvoie une chaine de caractere contenant les numeros des cases ou la piece
    en parametre peut être parachuter. Renvoie une chaine indiquant qu'aucune possibilite
    de parachuter la piece n'est possible le cas echeant.

    toStringPossibiliteesParachuter: Piece x Partie -> String
  */
  func toStringPossibiliteesParachuter(_ piece: Piece)-> String

  /**
   Renvoie true si l'entier c1 est une sous-chaîne de la
   deuxieme chaîne c2.

   verifierChoix: Int x String x Partie -> Bool

   - Exemple: verifierChoix(1,"1 - koropokkuru \n2- tanuki") renvoie vrai.
  */
  func verifierChoix(_ c1: Int, _ c2: String) -> Bool

  /** ----------------------------- Fonctions pour la gestion des positions ----------------------------*/

  /**
    Retourne vrai si la coordonnee de la case entree en parametre est une case
    qui se situe sur plateau de jeu, faux sinon.

    verifierCaseAutorisee:  Int x Partie -> Bool

    - Postcondition :
      - verifierCaseAutorisee(x,p) == true -> 0 <= p <= getLongueur(p) * getLargeur(p) - 1
      - verifierCaseAutorisee(x,p) == false -> p < 0 ou p > getLongueur(p) * getLargeur(p) - 1
  */
  func verifierCaseAutorisee(_ position: Int) -> Bool

  /**
   Renvoie vrai si la position entree en parametre contient une piece. Faux sinon.
   Renvoie une erreur si la precondition n'est pas respecte.

   caseVide : Int x Partie -> Bool

   - Precondition : la position entree est une position du plateau de jeu.
  */
  func caseVide(_ position: Int) throws -> Bool

  /**
   Renvoie vrai si la position rentree en parametre est une position de la zone de promotion
   du joueur adverse. Faux sinon. Renvoie une erreur si la precondition n'est pas respecte.

   casePromotion: Int x Partie -> Bool

   - Precondition : la position entree est une position du plateau de jeu.
  */
  func casePromotion(_ position : Int)  throws -> Bool

  /**
   Renvoie vrai si la position rentree en parametre contient une piece du joueur adverse.
   Faux sinon. Renvoie une erreur si la precondition n'est pas respecte.

   caseEnnemi: Int x Partie -> Bool

   - Precondition : la position entree est une position du plateau de jeu.
  */
  func caseEnnemi(_ position: Int) throws-> Bool

  /** ---------------------------------------- Gestion du jeu -----------------------------------------*/

  /**
   Renvoie Vrai si la position en parametre est a porte de la piece en parametre. Faux Sinon.
   Renvoie une erreur si la precondition n'est pas respecte.

   aPortee: Int x Piece x Partie -> Bool

    - Precondition : la position entree est une position du plateau de jeu.
  */
  func aPortee(_ position: Int, _ piece : Piece) throws -> Bool

  /**
   Verifie si la partie est termine ou pas. Une partie se termine lorsque que le roi du joueur adverse
   est en echec et mat ou lorsque le roi du joueur courant se trouve dans la zone
   de promotion adverse sans que celui-ci puisse être capture le coup suivant ou qu'on a capturer
   le roi du joueur adverse.

   verifierFinDuJeu: Partie -> Bool

   - Sortie: retourne vrai si la partie est termine. Faux sinon.
  */
  func verifierFinDuJeu() -> Bool

  /**
    Verifie si le joueur adverse est en echec et mat. Le joueur adverse est en echec
    et mat lorsqu'il n'a aucune possibilite de sauver son roi. C'est a dire si son roi
    ne peut plus bouger et si la piece qui met le roi en echec ne peut pas être capture.

    echecEtMat: Partie -> Bool

    - Sortie: retourne vrai si le joueur adverse est en echec et mat. Faux sinon.
  */
  func echecEtMat() -> Bool

  /**
    Verifie si le roi passe en parametre peut se deplacer et uniquement se deplacer.
    Renvoie une erreur si la precondition n'est pas respecte.

    possibiliteDeplacementRoi: Piece x Partie -> bool

    - Precondition: la piece en parametre est un roi
  */
  func possibiliteDeplacementRoi(_ piece: Piece) throws -> Bool

  /**
   Renvoie vrai si la piece passee en parametre peut être capture par au moins
   une des pieces de son adversaire. Faux sinon

   etrePieceCapturable : Piece x Partie -> Bool
  */
  func etrePieceCapturable(piece: Piece) -> Bool

  /**
    Renvoie vrai si la premiere piece en parametre peut capturer la deuxieme piece
    passee en parametre. Faux sinon.

    piece1capturePiece2 : Piece x Piece x Partie -> Bool

    - Entree:
      - piece1: la piece qui capture.
      - piece2: la piece qui est capture.
    - Precondition :
      - la piece qui capture et la piece capturee n'appartiennent pas au meme joueur.
  */
  func piece1capturePiece2(_ piece1: Piece,_ piece2: Piece) -> Bool

  /**
    Envoie la piece dans la reserve du joueur passee en parametre.
    Renvoie une erreur si les preconditions ne sont pas respecte.

    envoyerReserve: Piece x Joueur x Partie -> Partie

    - Precondition:
      - la piece en parametre ne peut pas etre un kodama samourai
      - la position de la piece en parametre doit etre vide.
    - Postcondition: la piece capture se situe dans la reserve du joueur en parametre.
  */
  mutating func envoyerReserve(_ piece: Piece, _ joueur: Joueur) throws

  /**
    Capture la piece sur le numero de la case passee en parametre et la rajoute
    a la reserve du joueur qui effectue la capture.
    Renvoie une erreur si les preconditions ne sont pas respecte.
    Rappel : le roi ne peut pas se mettre en echec.

    capturer: Piece x Int x Partie -> Partie

    - Entree:
      - piece : la piece qui effectue la capture
      - position : le numero de la case ou se situe la piece a capturer
    - Precondition:
      - Il y a une piece a la position de la case indique
      - la position entree doit etre valide
      - la piece qui effectue la capture appartient au joueur courant
      - la piece a capturer appartient au joueur adverse
    -Postcondition:
      - la piece qui effectue la capture se trouve a la position de la piece capture apres la capture.
      - un kodama samourai capture se transforme en kodama
      - la piece capture a une position vide apres la capture
      - la piece capture est envoye dans la reserve du joueur qui effectue la capture.
  */
  mutating func capturer(_ piece: Piece, _ position: Int) throws

  /**
   parachute la piece sur la case donnee en parametre.
   Renvoie une erreur si les preconditions ne sont pas respecte.

   parachuter: Partie x Piece x Int -> Partie

   - Entree:
    - piece: la piece a parachuter
    - position: le numero de case où parachuter la piece
   - Precondition:
   	- la position entree doit etre une case libre
    - la piece a parachuter se trouve dans la reserve du joueur courant.
    - la piece a parachuter a une position vide.
    - la position entree est une position valide.
   - Postcondition:
    - la position de la piece parachute est celle ou elle est parachute
    - un kodama parachute dans la zone de promotion adverse n'est pas promu.
  */
  mutating func parachuter(_ piece: Piece, _ position : Int) throws

  /**
   Deplace la piece a la position donnee en parametre.
   Rappel : le roi ne peut se mettre en echec.
   Renvoie une erreur si les preconditions ne sont pas respecte.

   deplacer: Piece x Int x Partie -> Partie

   - Precondition:
    - la position entree est une position valide
    - la position entree doit etre vide.
   - Postcondition:
    - un kodama qui se trouve dans la zone de promotion est promu kodama samourai.
  */
  mutating func deplacer(_ piece: Piece, _ position: Int) throws

  /**
    Renvoie la piece qu'il y a sur le numero de la case passee en parametre.
    Renvoie une erreur si la precondition n'est pas respecte.

    pieceSurCase: Partie x Int -> Piece

    - Entree : le numero de la case
    - Precondition: il y a une piece sur la case passee en parametre.
  */
  func pieceSurCase(_ position: Int) throws -> Piece

  /**
   Renvoie Vrai si la piece peut capturer la piece sur la position donnee en parametre. Renvoie Faux sinon.
   Renvoie une erreur si les preconditions ne sont pas respectees.
   Attention de ne pas mettre le roi en echec lors de la capture.

   captureAutorisee: Piece x Int x Partie -> Bool

   - Precondition:
    - Il y a une piece sur la case passee en parametre.
    - la position entree est une position du plateau de jeu.
  */
  func captureAutorisee(_ piece: Piece, _ position: Int) throws -> Bool

  /**
   Renvoie Vrai si la piece peut se déplacer et uniquement se deplacer sur le
   la position donnee en parametre. Renvoie Faux sinon.
   Renvoie une erreur si les preconditions ne sont pas respectees.
   Attention de ne pas mettre le roi en echec lors du deplacement.

   deplacementAutorise: Piece x Int x Partie -> Bool

   - Precondition:
    - il y a une piece sur la case passee en parametre.
    - la position entree est une position du plateau de jeu.
  */
  func deplacementAutorise(_ piece: Piece, _ position: Int) throws -> Bool
}
