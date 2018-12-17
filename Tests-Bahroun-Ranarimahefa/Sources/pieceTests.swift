import XCTest
@testable import pieceProtocol

final class pieceTests: XCTestCase {
    
    // tests creerPiece
    // test recuperation du nom d'une piece venant d'etre creee
    func test1CreerPiece(){
        let roi = Piece(nom : "koropokkuru",position : 0)
        XCTAssertEqual(roi.getNomPiece(), "koropokkuru")
    }
    
    // test recuperation de la position d'une piece venant d'etre creee
    func test2CreerPiece(){
        let roi = Piece(nom : "koropokkuru",position : 0)
        XCTAssertEqual(roi.getPosition, 0)
    }
    
    // test creation d'une piece avec une position vide
    func test3CreerPiece(){
        let roi = Piece(nom : "koropokkuru",position : nil)
        XCTAssertEqual(piece.getPosition,nil)
    }

    // test creation d'une piece avec un mauvais nom
    func test4CreerPiece(){
        XCTAssertThrowsError(try Piece(nom : "mauvaisNom", position : nil))
    }
    
    // test creation d'une piece avec une mauvaise position
    func test5CreerPiece(){
        XCTAssertThrowsError(try Piece(nom : "koropokkuru",position : -0.001))
    }
    
    // test setNomPiece
    // test verification de la modification du nom de la piece
    func test1setNomPiece(){
        var roi = Piece(nom : "kitsune", position : 0)
        roi.setNomPiece(nom : "koropokkuru")
        XCTAssertEqual(roi.getNomPiece(),"koropokkuru")
    }
    
    //tests estRoi
    // test pour verifier que la fonction estRoi() renvoie bien true si la piece est un koropokkuru
    func test1EstRoi(){
        let roi = Piece(nom : "koropokkuru", position : 0)
        XCTAssertEqual(roi.estRoi(),true)
    }
    
    // test pour verifier que la fonction estRoi() renvoie bien false si la piece n'est pas un koropokkuru
    func test2EstRoi(){
        let kitsune = Piece("kitsune",0)
        XCTAssertEqual(kitsune.estRoi(),false)
    }
    
    // tests estKodama
    // test pour verifier que la fonction estKodama() renvoie bien true si la piece est un kodama
    func test1EstKodama(){
        let kodama = Piece(nom : "kodama", position : 0)
        XCTAssertEqual(kodama.estKodama(),true)
    }
    
    // test pour verifier que la fonction estKodama() renvoie bien false si la piece n'est pas un kodama
    func test2EstKodama(){
        let kitsune = Piece(nom : "kitsune", position : 0)
        XCTAssertEqual(kitsune.estKodama(),false)
    }

    // tests estKodamaSamurai
    // test pour verifier que la fonction estKodamaSamurai() renvoie bien true si la piece est un kodama samuraï
    func test1EstKodamaSamurai(){
        let kodamaSamurai = Piece(nom : "kodama samuraï", position : 0)
        XCTAssertEqual(kodama.estKodamaSamurai(),true)
    }
    
    // test pour verifier que la fonction estKodamaSamurai() renvoie bien false si la piece n'est pas un kodama samuraï
    func test2EstKodama(){
        let kitsune = Piece(nom : "kitsune", position : 0)
        XCTAssertEqual(kitsune.estKodamaSamurai(),false)
    }
    // tests transformerEnKodamaSamurai
    // verifie que la transformation est faite
    func test1transformerEnKodamaSamurai(){
        var futurSamurai = Piece(nom : "kodama", position : 1)
        futurSamurai.transformerEnKodamaSamurai()
        XCTAssertEqual(futurSamurai.getNomPiece(),"kodama samuraï")
    }
    // verifie que la transformation est impossible sur une piece autre qu'un kodama
    func test1transformerEnKodamaSamurai(){
        var kitsune = Piece(nom : "kitsune", position : 1)
        XCTAssertThrowsError(try kitsune.transformerEnKodamaSamurai())
    }
    
    // tests transformerEnKodama
    // verifie que la transformation est faite
    func test1transformerEnKodama(){
        var futurKodama = Piece(nom : "kodama samuraï",position : 1)
        futurKodama.transformerEnKodama()
        XCTAssertEqual(futurKodama.getNomPiece(),"kodama")
    }
    // verifie que la transformation est impossible sur une piece autre qu'un kodama samuraï
    func test2transformerEnKodama(){
        var kitsune = Piece(nom : "kitsune",position : 1)
        XCTAssertThrowsError(try kitsune.transformerEnKodamaSamurai())
    }

    static var allTests = [
        ("test1CreerPiece", test1CreerPiece),
        ("test2CreerPiece", test2CreerPiece),
        ("test3CreerPiece", test3CreerPiece),
        ("test4CreerPiece", test4CreerPiece),
        ("test5CreerPiece", test5CreerPiece),
        ("test1setNomPiece", test1setNomPiece),
        ("test1EstRoi", test1EstRoi),
        ("test2EstRoi", test2EstRoi),
        ("test1EstKodama", test1EstKodama),
        ("test2EstKodama", test2EstKodama),
        ("test1EstKodamaSamurai", test1EstKodamaSamurai),
        ("test2EstKodamaSamurai", test2EstKodamaSamurai),
        ("test1transformerEnKodamaSamurai", test1transformerEnKodamaSamurai),
        ("test2transformerEnKodamaSamurai", test2transformerEnKodamaSamurai),
        ("test1transformerEnKodama", test1transformerEnKodama),
        ("test2transformerEnKodama", test2transformerEnKodama),
    ]
}
