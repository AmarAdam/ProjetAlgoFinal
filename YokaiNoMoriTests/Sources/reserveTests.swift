import XCTest

@testable import ReserveProtocol

final class reserveTests: XCTestCase {
    
    // tests init
    // test qui vérifie que la reserve ne contient pas de carte à la création
    func test1init(){
        let reserve = init()
        XCTAssertEqual(reserve.nbPieceReserve(), 0)
    }
    
    // test qui vérifie que la reserve est vide à la création
    func test2init(){
        let reserve = init()
        XCTAssertEqual(reserveVide(reserve), true)
    }
    
    // test ajouterReserve
    // test qui vérifie le nombre de piece dans la reserve apres un ajout
    func test1ajouterReserve(){
        var reserve = init()
        let piece = creerPiece("kitsune",0)
        reserve.ajouterReserve(piece)
        XCTAssertEqual(reserve.nbPieceReserve, 1)
    }
    
    // test qui vérifie que la reserve n'est pas vide apres un ajout
    func test2ajouterReserve(){
        var reserve = init()
        let piece = creerPiece("kitsune",0)
        reserve.ajouterReserve(piece)
        XCTAssertEqual(reserveVide(reserve), false)
    }

    // test qui vérifie que la piece envoyé dans la reserve a bien une position Vide
    func test3ajouterReserve(){
        var reserve = init()
        let piece = creerPiece("kitsune",0)
        reserve.ajouterReserve(piece)
        XCTAssertEqual(piece.getPosition(),nil)
    }

    // tests enleverReserve
    // test qui verifie que la piece ajoutee a bien ete enlevee
    func test1enleverReserve(){
        var reserve = init()
        let piece1 = creerPiece("kitsune",0)
        let piece2 = creerPiece("kodama",1)
        reserve.ajouterReserve(piece1)
        reserve.ajouterReserve(piece2)
        reserve.enleverReserve(piece1)
        XCTAssertEqual(reserve.nbPieceReserve(), 0)
    }   

    // test qui verifie que la Reserve qui contenait une seule piece devient vide suite a la suppression de cette piece
    func test2enleverReserve(){
        var reserve = init()
        let piece1 = creerPiece("kitsune",0)
        reserve.ajouterReserve(piece1)
        reserve.enleverReserve(piece1)
        XCTAssertEqual(reserveVide(reserve), true)
    }

    // tests toStringReserve
    // test toStringReserve quand la reserve contient des pieces
    func test1toStringReserve(){
        var reserve = init()
        let piece1 = creerPiece("kitsune",nil)
        let piece2 = creerPiece("kodama",nil)
        reserve.ajouterReserve(piece1)
        reserve.ajouterReserve(piece2)
        XCTAssertEqual(reserve.toStringReserve(),"kitsune,kodama")
    }

    // test toStringReserve quand la reserve est vide 
    func test2toStringReserve(){
        var reserve = init()
        XCTAssertEqual(reserve.toStringReserve(),"la reserve est vide")
    }

    static var allTests = [
        ("test1CreerJoueur", test1CreerJoueur()),
    ]
}
