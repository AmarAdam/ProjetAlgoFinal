import XCTest

@testable import Partie
@testable import Joueur
@testable import Piece
@testable import CollectionPiece
@testable import Reserve

final class partieTests: XCTestCase {

  // test si renvoye bien la largeur
  func testverifiergetLargeur(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    XCTAssertEqual(partie.getLargeur(),3 )
  }

  // test si renvoye bien la longueur
  func testverifiergetLongueur(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    XCTAssertEqual(partie.getLongueur(),4 )
  }

  // test la fonction verifierCaseAutorisee
  func test1verifierCaseAutorisee(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    XCTAssertEqual(partie.verifierCaseAutorisee(position: -1), false)
  }

  // test la fonction verifierCaseAutorisee
  func test2verifierCaseAutorisee(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    XCTAssertEqual(partie.verifierCaseAutorisee(position: 2), true)
  }

  func testverifiergetJoueurCourant(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    var joueurtest = Joueur(nom:"joueurtest")
    partie.setJoueurCourant(joueur: joueurtest)
    XCTAssertEqualObjects(partie.getJoueurCourant(), joueurtest)
  }

  func testverifiergetJoueurAdverse(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    var joueurtest = Joueur(nom:"joueurtest")
    partie.setJoueurAdverse(joueur: joueurtest)
    XCTAssertEqualObjects(partie.getJoueurAdverse(), joueurtest)
  }

  func testverifierchangerJoueur(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    var joueurtest1 = Joueur(nom:"joueurtest1")
    var joueurtest2 = Joueur(nom:"joueurtest2")
    partie.setJoueurCourant(joueur: joueurtest1)
    partie.setJoueurAdverse(joueur: joueurtest2)
    partie.changerJoueur()
    XCTAssertEqualObjects(partie.getJoueurCourant(), joueurtest2)
  }

  func testselectionnerPiecePlateau(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    var joueurtest1 = Joueur(nom:"joueurtest1")
    partie.setJoueurCourant(joueur: joueurtest1)
    var tanuki = Piece(nom : "tanuki", position : 6)
    partie.getJoueurCourant().getCollectionPieceJoueur().ajouterCollectionPiece(piece : tanuki)
    tanuki2 = partie.selectionnerPiece(num : 1, choix : "1 - tanuki")
    XCTAssertEqualObjects(tanuki, tanuki2)
  }

  func test1caseVide(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    XCTAssertFalse(partie.caseVide(0),false)
  }

  func test2caseVide(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    XCTAssertTrue(partie.caseVide(5),true)
  }

  func test3caseVide(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    XCTAssertThrows(partie.caseVide(-1))
  }

  func test1casePromotion(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    XCTAssertTrue(partie.casePromotion(11))
  }

  func test2casePromotion(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    XCTAssertFalse(partie.casePromotion(11))
  }
  
  func test3casePromotion(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    XCTAssertThrows(partie.casePromotion(-1))
  }

  func test1APortee(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    partie.setJoueurCourant(partie.getJoueur1())
    let kodama = partie.getJoueurCourant().getCollectionPieceJoueur("kodama")
    XCTAssertTrue(partie.aPortee(7,kodama))
  }
  
  func test2APortee(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    partie.setJoueurCourant(partie.getJoueur1())
    let kodama = partie.getJoueurCourant().getCollectionPieceJoueur("kodama")
    XCTAssertFalse(partie.aPortee(8,kodama))
  }

  func test3APortee(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    partie.setJoueurCourant(partie.getJoueur1())
    let kodama = partie.getJoueurCourant().getCollectionPieceJoueur("kodama")
    XCTAssertThrows(partie.aPortee(-1,kodama))
  }

  func test1possibiliteDeplacementRoi(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    partie.setJoueurCourant(partie.getJoueur1())
    let roi = partie.getJoueurCourant().getCollectionPieceJoueur("koropokkuru")
    XCTAssertTrue(partie.possibiliteDeplacementRoi(roi))
  }

  func test2possibiliteDeplacementRoi(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    partie.setJoueurCourant(partie.getJoueur1())
    var tanuki = Piece(nom : "tanuki", position : 3)
    partie.getJoueurCourant().getCollectionPieceJoueur().ajouterCollectionPiece(piece : tanuki)
    var kodama = Piece(nom : "kodama", position : 5)
    partie.getJoueurCourant().getCollectionPieceJoueur().ajouterCollectionPiece(piece : kodama)
    let roi = partie.getJoueurCourant().getCollectionPieceJoueur("koropokkuru")
    XCTAssertFalse(partie.possibiliteDeplacementRoi(roi))
  }

  func test3possibiliteDeplacementRoi(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    partie.setJoueurCourant(partie.getJoueur1())
    let fauxRoi = partie.getJoueurCourant().getCollectionPieceJoueur("kodama")
    XCTAssertThrows(partie.possibiliteDeplacementRoi(fauxRoi))
  }

  func test1Piece1capturePiece2(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    partie.setJoueurCourant(partie.getJoueur1())
    let kodama1 = partie.getJoueurCourant().getCollectionPieceJoueur("kodama")
    let kodama2 = partie.getJoueurAdverse().getCollectionPieceJoueur("kodama")
    XCTAssertTrue(partie.piece1capturePiece2(kodama1,kodama2))
  }

  func test2Piece1capturePiece2(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    partie.setJoueurCourant(partie.getJoueur1())
    let kodama1 = partie.getJoueurCourant().getCollectionPieceJoueur("kodama")
    let roi2 = partie.getJoueurAdverse().getCollectionPieceJoueur("koropokkuru")
    XCTAssertFalse(partie.piece1capturePiece2(kodama1,roi2))
  }

  func test3Piece1capturePiece2(){
      var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
      partie.setJoueurCourant(partie.getJoueur1())
      let kodama1 = partie.getJoueurCourant().getCollectionPieceJoueur("kodama")
      let roi1 = partie.getJoueurCourant().getCollectionPieceJoueur("koropokkuru")
      XCTAssertThrows(partie.piece1capturePiece2(kodama1,roi1))
  }
  
  func test1envoyerReserve(){
      var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
      partie.setJoueurCourant(partie.getJoueur1())
      let kodama = partie.getJoueurAdverse().getCollectionPieceJoueur("kodama")
      partie.envoyerReserve(kodama,partie.getJoueurCourant())
      XCTAssertEqual(partie.getJoueurCourant().nbPieceReserve(),1)
  }

  func test2envoyerReserve(){
      var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
      partie.setJoueurCourant(partie.getJoueur1())
      let kodamaSamurai = partie.getJoueurAdverse().getCollectionPieceJoueur("kodama samuraï")
      partie.envoyerReserve(kodamaSamurai,partie.getJoueurCourant())
      XCTAssertThrows(partie.envoyerReserve(kodamaSamurai,partie.getJoueurCourant()))
  }

  func test1caseEnnemi(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    partie.setJoueurCourant(partie.getJoueur1())
    XCTAssertTrue(partie.caseEnnemi(11))
  }

  func test2caseEnnemi(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    partie.setJoueurCourant(partie.getJoueur1())
    XCTAssertFalse(partie.caseEnnemi(2))
  }

  func test3caseEnnemi(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    XCTAssertThrows(partie.caseEnnemi(-1))
  }

  func testverifierFinDuJeu(){
    var partie = Partie(nom1: "joueur1",nom2: "joueur2",largeur : 3,longeur:4)
    XCTAssertFalse(partie.verifierFinDuJeu())
  }

  func test1echecEtMat(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    var kodama = partie.getJoueurCourant().getCollectionPieceJoueur().getPieceCollectionPiece("kodama",4)
    partie.capturer(kodama, 7)
    var kitsune1 = Piece(nom : "kitsune", position : 6)
    partie.getJoueurCourant().getCollectionPieceJoueur().ajouterCollectionPiece(piece : kitsune1)
    var kitsune2 = Piece(nom : "kitsune", position : 8)
    partie.getJoueurCourant().getCollectionPieceJoueur().ajouterCollectionPiece(piece : kitsune2)
    var kitsune = partie.getJoueurCourant().getCollectionPieceJoueur().getPieceCollectionPiece("kitsune",2)
    partie.deplacer(tanuki,4)
    XCTAssertTrue(partie.echecEtMat())
  }

  func test2echecEtMat(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    var kodama = partie.getJoueurCourant().getCollectionPieceJoueur().getPieceCollectionPiece("kodama",4)
    partie.capturer(kodama, 7)
    XCTAssertFalse(partie.echecEtMat())
  }

  func test1etrePieceCapturable(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    var kodama = partie.getJoueurCourant().getCollectionPieceJoueur().getPieceCollectionPiece("kodama",4)
    XCTAssertTrue(partie.etrePieceCapturable(kodama))
  }

  func test2etrePieceCapturable(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    var kitsune = partie.getJoueurCourant().getCollectionPieceJoueur().getPieceCollectionPiece("kitsune",2)
    XCTAssertFalse(partie.etrePieceCapturable(kitsune))
  }

  func test1capturer(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    var tanuki = partie.getJoueurCourant().getCollectionPieceJoueur().getPieceCollectionPiece("tanuki",0)
    XCTAssertThrows(partie.capturer(tanuki,3))
  }

  func test2capturer(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    var tanuki = partie.getJoueurCourant().getCollectionPieceJoueur().getPieceCollectionPiece("tanuki",0)
    XCTAssertThrows(partie.capturer(tanuki,1))
  }

  func test3capturer(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    var tanuki = partie.getJoueurCourant().getCollectionPieceJoueur().getPieceCollectionPiece("tanuki",0)
    XCTAssertThrows(partie.capturer(tanuki,46))
  }

  func test4capturer(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    var kodama = partie.getJoueurAdverse().getCollectionPieceJoueur().getPieceCollectionPiece("kodama",7)
    XCTAssertThrows(partie.capturer(tanuki,7))
  }

  func test1VerifierChoix(){
    c1 = 1
    c2 = "1 - kodama \n 2- tanuki")
    XCTAssertTrue(partie.verifierChoix(c1,c2))
  }

  func test2VerifierChoix(){
    c1 = 3
    c2 = "1 - kodama \n 2- tanuki")
    XCTAssertFalse(partie.verifierChoix(c1,c2))
  }

  func test1parachuter(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    var kodama = partie.getJoueurCourant().getCollectionPieceJoueur().getPieceCollectionPiece("kodama",4)
    XCTAssertThrows(partie.parachuter(tanuki,8))
  }

  func test2parachuter(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    var kodama = partie.getJoueurAdverse().getCollectionPieceJoueur().getPieceCollectionPiece("kodama",7)
    partie.envoyerReserve(kodama,partie.getJoueurCourant())
    var kodama1 = partie.getJoueurCourant().getReserve().getPieceReserve("kodama")
    XCTAssertThrows(partie.parachuter(kodama1,10))
  }

  func test3parachuter(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    var kodama = partie.getJoueurAdverse().getCollectionPieceJoueur().getPieceCollectionPiece("kodama",7)
    partie.envoyerReserve(kodama,partie.getJoueurCourant())
    var kodama1 = partie.getJoueurCourant().getReserve().getPieceReserve("kodama")
    XCTAssertThrows(partie.parachuter(kodama1,-32))
  }

  func test1deplacer(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    var tanuki = partie.getJoueurCourant().getCollectionPieceJoueur().getPieceCollectionPiece("tanuki",0)
    XCTAssertThrows(partie.deplacer(tanuki,1))
  }

  func test2deplacer(){
    var partie = Partie("joueur1","joueur2",3,4)
    partie.setJoueurCourant(partie.getJoueur1())
    var tanuki = partie.getJoueurCourant().getCollectionPieceJoueur().getPieceCollectionPiece("tanuki",0)
    XCTAssertThrows(partie.deplacer(tanuki,-45))
  }



static var allTests = [
        ("testverifiergetLargeur", testverifiergetLargeur),
        ("testverifiergetLongueur", testverifiergetLongueur),
        ("test1verifierCaseAutorisee", test1verifierCaseAutorisee),
        ("test2verifierCaseAutorisee", test2verifierCaseAutorisee),
        ("testverifiergetJoueurCourant", testverifiergetJoueurCourant),
        ("testverifiergetJoueurAdverse", testverifiergetJoueurAdverse),
        ("testverifierchangerJoueur", testverifierchangerJoueur),
        ("testselectionnerPiecePlateau", testselectionnerPiecePlateau),
        ("test1caseVide",test1caseVide),
        ("test2caseVide",test2caseVide),
        ("test3caseVide",test3caseVide),
        ("test1casePromotion", test1casePromotion),
        ("test2casePromotion", test2casePromotion),
        ("test3casePromotion", test3casePromotion),
        ("test1APortee",test1APortee),
        ("test2APortee",test2APortee),
        ("test3APortee",test3APortee),
        ("test1possibiliteDeplacementRoi",test1possibiliteDeplacementRoi),
        ("test2possibiliteDeplacementRoi",test2possibiliteDeplacementRoi),
        ("test3possibiliteDeplacementRoi",test3possibiliteDeplacementRoi),
        ("test1Piece1capturePiece2",test1Piece1capturePiece2),
        ("test2Piece1capturePiece2",test2Piece1capturePiece2),
        ("test3Piece1capturePiece2",test3Piece1capturePiece2),
        ("test1envoyerReserve",test1envoyerReserve),
        ("test2envoyerReserve",test2envoyerReserve),
        ("test1caseEnnemi",test1caseEnnemi),
        ("test2caseEnnemi",test2caseEnnemi),
        ("test3caseEnnemi",test3caseEnnemi),
        ("testverifierFinDuJeu",testverifierFinDuJeu),
        ("test1echecEtMat",test1echecEtMat),
        ("test2echecEtMat",test2echecEtMat),
        ("test1etrePieceCapturable",test1etrePieceCapturable),
        ("test2etrePieceCapturable",test2etrePieceCapturable),
        ("test3etrePieceCapturable",test3etrePieceCapturable),
        ("test1capturer",test1capturer),
        ("test2capturer",test2capturer),
        ("test3capturer",test3capturer),
        ("test4capturer",test4capturer),
        ("test1VerifierChoix",test1VerifierChoix),
        ("test2VerifierChoix",test2VerifierChoix),
        ("test1parachuter",test1parachuter),
        ("test2parachuter",test2parachuter),
        ("test3parachuter",test3parachuter),
        ("test1deplacer",test1deplacer),
        ("test2deplacer",test2deplacer)
    ]


}
