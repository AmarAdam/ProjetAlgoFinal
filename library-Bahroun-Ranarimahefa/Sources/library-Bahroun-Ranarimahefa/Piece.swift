fileprivate class Piece {

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

  func estRoi() -> Bool {

  	if self.getNomPiece() == "koropokkuru" {
  		return true
  	}
  	else {
  		return false
  	}
  }

  func estKodama() -> Bool {

  	if self.getNomPiece() == "kodama" {
  		return true
  	}
  	else {
  		return false
  	}
  }

  func estKodamaSamurai() -> Bool {

  	if self.getNomPiece() == "kodama samurai" {
  		return true
  	}
  	else {
  		return false
  	}
  }

  func transformerEnKodamaSamurai() throws {

  }

  func transformerEnKodama() throws -> Piece {

	guard self.estKodama() else {
  		self.setNomPiece("kodama")
  	}
  	else throws {
  		GestionErrorPiece.invalidKodama
  	}
  }

}
