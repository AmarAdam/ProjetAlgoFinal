import Piece
import Partie
import Reserve
import Joueur

    var largeur = 3
    var longueur = 4
    var stopPlaying = false
    while !stopPlaying {
        print(" Donner le nom du joueur 1 : \n")
        var nomJ1 = readLine()
        print(" Donner le nom du joueur 2 : \n")
        var nomJ2 = readLine()
        var askChange = false
        while !askChange {
            print(" Voulez vous modifier la taille du plateau ? (version classique = 12 cases) \n")
            print(" entrer \"oui\" ou \"non\" \n")
            var change = readLine()
            if (change == "oui"){
                askChange = true
                var goodLargeur = false
                while !goodLargeur {
                    print("entrer un entier correspondant à la largeur du plateau \n")
                    if let larg = readLine(){
                        if let larg1 = Int(larg){
                            if larg1>0 {
                                largeur = larg1
                                goodLargeur =  true
                            }
                        }
                    }
                }
                var goodLongueur = false
                while !goodLongueur{
                    print("entrer un entier correspondant à la longueur du plateau \n")
                    if let long = readLine(){
                        if let long1 = Int(long) {
                            if long1>0 {
                                longueur = long1
                                goodLongueur = true
                            }
                        }
                    }
                }
            }else if(change == "non"){
                askChange = true
            }else{
                print("reponse inconnue, recommencer")
            }
        }

        partie = Partie(nomJ1,nomJ2,largeur,longueur)

        var fin = false
        while !fin {

            // affichage des donnes de la partie
            print(partie.toStringPlateau())
            print("Reserve de \(partie.getJoueurCourant().getNomJoueur()) : \(partie.getJoueurCourant().toStringReserve())\n")
            print("Reserve de \(partie.getJoueurAdverse().getNomJoueur()) : \(partie.getJoueurAdverse().toStringReserve())\n")
            print("Le joueur \(partie.getJoueurCourant().getNomJoueur()) doit jouer \n")
            var choixCorrecte = false

            // demande du choix a l'utilisateur
            while !choixCorrecte {
                print(partie.toStringChoix())
                print("entrer le numéro du choix souhaité : \n")
                var choix = readLine()
                if let choixInt = Int(choix!){
                    choixCorrecte = partie.verifierChoix(choixInt,partie.toStringChoix())
                }
            }
            var choixInt = Int(choix!)

            // choix : deplacer
            if (choixInt == 1){
                var piecePossible = false
                while !piecePossible {
                    print(partie.toStringPiecesDispoDeplacement())
                    print("Choisissez un numéro de pièce à utiliser \n")
                    choixPiece = readLine()
                    // on verifie si la piece choisie est correcte
                    if let choixPieceInt = Int(choixPiece!){
                        piecePossible = partie.verifierChoix(choixPieceInt,partie.toStringPiecesDispoDeplacement())
                    }
                }
                var choixPieceInt = Int(choixPiece!)
                var piece = partie.selectionnerPiecePlateau(choixPieceInt,partie.toStringPiecesDispoCapture())
                casePossible = false
                while !casePossible{
                    print("les possibilités de deplacement de \(piece.getNomPiece())")
                    print(partie.toStringPossibiliteesDeplacement(piece))
                    print("Choisissez le numéro de case où vous souhaitez déplacer la pièce \n")
                    choixCase = readLine()
                    // on verifie si la case choisie est correcte
                    if let choixCaseInt = Int(choixCase!){
                        casePossible  = partie.deplacementAutorise(choixCaseInt,piece)
                    }
                }
                var choixCaseInt = Int(choixCase!)
                partie.deplacer(piece,choixCaseInt)

            // choix : capturer
            }else if (choixInt == 2) {

                piecePossible = false
                while !piecePossible  {
                    print(partie.toStringPiecesDispoCapture())
                    print("Choisissez un numéro de pièce à utiliser \n")
                    choixPiece = readLine()
                    // on verifie si la piece choisie est correcte
                    if let choixPieceInt = Int(choixPiece!){
                        piecePossible = partie.verifierChoix(choixPieceInt,partie.toStringPiecesDispoCapture())
                    }
                }
                var choixPieceInt = Int(choixPiece!)
                piece = partie.selectionnerPiecePlateau(choixPieceInt,partie.toStringPiecesDispoCapture())
                casePossible = false
                while !casePossible{
                    print(partie.toStringPossibiliteesCapture(piece))
                    print("Choisissez le numéro de case à capturer par \(piece.getNomPiece()) \n")
                    choixCase = readLine()
                    // on verifie si la case choisie est correcte
                    if let choixCaseInt = Int(choixCase!){
                        casePossible = partie.captureAutorisee(choixCaseInt,piece)
                    }
                }
                var choixCaseInt = Int(choixCase!)
                partie.capturer(piece,choixCaseInt)

            // choix : parachuter
            }else if (choixInt == 3){
                    piecePossible = false
                    while !piecePossible {
                        print(partie.toStringPiecesDispoParachutage())
                        print("Choisissez un numéro de pièce à utiliser \n")
                        choixPiece = readLine()
                        // on verifie si la piece choisie est correcte
                        if let choixPieceInt = Int(choixPiece!){
                            piecePossible = partie.verifierChoix(choixPieceInt,toStringPiecesDispoParachutage())
                        }
                    }
                    var choixPieceInt = Int(choixPiece!)
                    piece = partie.selectionnerPieceReserve(choixPieceInt,toStringPiecesDispoParachutage())
                    casePossible = false
                    while !casePossible {
                        print(partie.toStringPossibiliteesParachuter(piece))
                        print("Choisissez le numéro de case où vous souhaitez parachuter la pièce \(piece.getNomPiece()) \n")
                        choixCase = readLine()
                        // on verifie si la case choisie est correcte
                        if let choixCaseInt = Int(choixCase!){
                            casePossible  = partie.caseVide(choixCaseInt)
                        }
                    }
                    choixCaseInt = Int(choixCase!)
                    partie.parachuter(piece,choixCaseInt)
                }

                // on verifie si le jeu est termine
                if partie.verifierFinDuJeu() {
                    fin = true
                    var vainqueur = partie.getNomJoueurCourant()

                }else{
                    partie.changerJoueur()
                }
            }
            print(" Le vainqueur est \(vainqueur) ! ")
        }

        // on demande si il veut rejouer
        answerReplay = false
        while !answerReplay {
            print("Voulez vous rejouer ?")
            print("taper oui ou non")
            answer = readLine()
            if(answer == "oui"){
                answerReplay = true
            }else if(answer == "non"){
                answerReplay = true
                stopPlaying = true
            }else{
                print("réponse inconnue")
            }
        }
