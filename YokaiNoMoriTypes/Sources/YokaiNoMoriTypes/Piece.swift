import Foundation

public class Piece : PieceProtocol {

    var nom : String
    var position : Int?

    init(_ nom : String , _ position : Int ) {
        self.nom = nom
        self.position = position      // vide si dans la reserve
    } // End func init

    func getNomPiece() -> String {
        return self.nom
    } // End func getNomPiece

    func setNomPiece(_ nom : String) {
        self.nom = nom
    } // End func setNomPiece

    func getPosition()-> Int? {
        return self.position
    } // End func getPosition

    //ajout de cette fonction, sinon impossible de traiter le type Partie
    func setPosition(_ position: Int) {
        self.position = position
    } // End func setPosition

    func estRoi() -> Bool {
      return self.getNomPiece() == "koropokkuru"
    } // End func estRoi

    func estKodama() -> Bool {
        return self.getNomPiece() == "kodama"
    } // End func estKodama

    func estKodamaSamurai() -> Bool {
        return self.getNomPiece() == "kodama samurai"
    } // End func estKodamaSamurai

    func transformerEnKodamaSamurai() throws {
        guard self.estKodama() else {
            print("piece non valide")
            return
        }
        self.setNomPiece("kodama samurai")
    } // End func transformerEnKodamaSamurai

    func transformerEnKodama() throws -> Piece {
        guard self.estKodamaSamurai() else {
            print("piece non valide")
            return
        }
        self.setNomPiece("kodama")
        return self
    } // End func transformerEnKodama

} // End Class
