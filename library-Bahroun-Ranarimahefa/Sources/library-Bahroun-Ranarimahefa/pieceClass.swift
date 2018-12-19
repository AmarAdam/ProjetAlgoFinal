/*
Reserve => Liste de Piece
CollectionPiece => Liste de Piece
Partie => classe
  * xMax
  * yMax
  //On ne fera pas de tableau : on consultera directement les pieces a partir des joueurs de Partie
  * Joueur (j1)
  * Joueur (j2)
*/

//Classe Piece
fileprivate class Piece {
    var name : String
    var position : Int?

    // Constructeur de Piece
    init(_ nom : String , _ position : Int ) {
      self.name = nom
      self.position = position
    }

    // getter NomPiece
    func getNomPiece() -> String {
      return self.name
    }

    // setter NomPiece
    func setNomPiece(_ nom : String) -> Self {
      self.name = nom
      return self
    }

    // getter Position
    func getPosition()-> Int? {
      return self.position
    }

    // True si la piece est un roi
    func estRoi() -> Bool {
      return (self.name == "koropokkuru")
    }

    // True si la piece est un kodama
    func estKodama() -> Bool {
      return (self.name == "kodama")
    }

    // True si la piece est un kodama samurai
    func estKodamaSamurai() -> Bool {
      return (self.name == "kodama samurai")
    }

    // // Transforme la piece kodama en kodama samurai
    // func transformerEnKodamaSamurai() throws {
    // }
    //
    // // Transforme le kodama samurai en kodama
    // func transformerEnKodama() throws {
    //   do {
    //     if self.estKodama() {
    //       try self.setNomPiece("kodama")
    //     }
    //   } catch fatalError {
    //       "Impossible"
    //   }
    // }
}
