import XCTest

@testable import collectionPiece
@testable import Piece


final class collectionPieceTests: XCTestCase {
    
    // tests init
    // test qui vérifie que la reserve ne contient pas de carte à la création
    func test1init(){
        let collectionPiece = CollectionPiece()
        XCTAssertEqual(collectionPiece.nbPieceCollectionPiece(), 0)
    }
    

    func test1ajouterCollectionPiece{
    	var collectionPiece = CollectionPiece()
    	let kitsune2 = Piece(nom : "kitsune", position : 3)
    	collectionPiece.ajouterCollectionPiece(kitsune2)
    	XCTAssertEqual(collectionPiece.nbPieceCollectionPiece(), 1)
    }

    func test2ajouterCollectionPiece{
    	var collectionPiece = CollectionPiece()
    	let kitsune2 = Piece(nom : "kitsune", position : 3)
    	collectionPiece.ajouterCollectionPiece(kitsune2)
    	XCTAssertEqualObjects(collectionPiece.getPieceCollectionPiece(nom : "kitsune" , position : 3), kitsune2)
    }

    func test3ajouterCollectionPiece{
    	var collectionPiece = CollectionPiece()
    	let kitsune2 = Piece(nom : "kitsune", position : 3)
    	collectionPiece.ajouterCollectionPiece(kitsune2)
    	XCTAssertEqual(collectionPiece.estDansCollectionPiece(nom : "kitsune" , position : 3), true )
    }

    func test1retirerCollectionPiece(){
    	var collectionPiece = CollectionPiece()
    	let kitsune2 = Piece(nom : "kitsune", position : 3)
    	collectionPiece.ajouterCollectionPiece(kitsune2)
    	collectionPiece.retirerCollectionPiece(kitune2)
    	XCTAssertEqual(collectionPiece.nbPieceCollectionPiece(), 0)
    }   

    static var allTests = [
        ("test1init", test1init()),
        ("test1ajouterCollectionPiece", test1ajouterCollectionPiece()),
        ("test2ajouterCollectionPiece", test2ajouterCollectionPiece()),
        ("test3ajouterCollectionPiece", test3ajouterCollectionPiece()),
        ("test1retirerCollectionPiece", test1retirerCollectionPiece()),

    ]
}
