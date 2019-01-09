import Foundation

public class Piece {

  var nom : String
  var position : Int?

  enum GestionErrorPiece: Error {
    case invalidKodama
}

  init(_ nom : String , _ position : Int ) {
  	self.nom = nom
  	self.position = position      // vide si dans la reserve
  }

  func getNomPiece() -> String {
  	return self.nom
  }

  func setNomPiece(_ nom : String) {
  	self.nom = nom
  }

  func getPosition()-> Int? {
  	return self.position
  }

  //ajout de cette fonction, sinon impossible de traiter le type Partie
  func setPosition(_ position: Int) {
      self.position = position
  }

  func estRoi() -> Bool {
  	return self.getNomPiece() == "koropokkuru"
  }

  func estKodama() -> Bool {
  	return self.getNomPiece() == "kodama"
  }

  func estKodamaSamurai() -> Bool {
  	return self.getNomPiece() == "kodama samurai"
  }

  func transformerEnKodamaSamurai() throws {
    guard self.estKodama() else throws{
      GestionErrorPiece.invalidKodama
    }
    self.setNomPiece("kodama samurai")
  }

  func transformerEnKodama() throws -> Piece {
    guard self.estKodamaSamurai() else throws {
      GestionErrorPiece.invalidKodama
  	}

  	self.setNomPiece("kodama")

  }


}
