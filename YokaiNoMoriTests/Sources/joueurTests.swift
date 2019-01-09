import XCTest

@testable import JoueurProtocol

final class joueurTests: XCTestCase {
    
    // tests creerJoueur
    // test qui vérifie que la collection du joueur possède 4 cartes
    func test1CreerJoueur(){
        let j1 = Joueur("J1")
        XCTAssertEqual(j1.nbPieceCollectionPiece(), 4)
    }
    
    // test qui vérifie le nom du joueur créé
    func test2CreerJoueur(){
        let j1 = Joueur("J1")
        XCTAssertEqual(j1.getNomJoueur(),"J1")
    }
    
    // test qui vérifie que la réserve d'un nouveau joueur est vide
    func test3CreerJoueur(){
        let j1 = Joueur("J1")
        XCTAssertEqual(j1.getReserve(),nil)
    }

    
    static var allTests = [
        ("test1CreerJoueur", test1CreerJoueur()),
        ("test2CreerJoueur", test2CreerJoueur()),
        ("test3CreerJoueur", test3CreerJoueur()),
    ]
}
