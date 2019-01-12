/**
  La reserve est une collection de pieces.
  Ce protocol sera implemente par un type nomme Reserve.
*/

import Foundation

protocol ReserveProtocol : Sequence {

    associatedtype Piece : PieceProtocol
    associatedtype ItReserve : IteratorProtocol

	/**
	 Creer une reserve vide.

	 creerReserve: -> Reserve

   - Postcondition:
      - la reserve creee est vide. reserveVide(creerReserve()) == True.
      - nbPieceReserve(creerReserve()) == 0.
	*/
  init()

	/**
	 Ajoute la piece donnee en parametre dans la reserve. Renvoie une erreur si
   les preconditions ne sont pas respecte

   ajouterReserve: Piece x Reserve -> Reserve

   - Precondition:
      - un kodama samourai ne peut pas etre ajoute a la reserve.
      - la position de la piece ajoute est vide.
	*/
	mutating func ajouterReserve(_ piece : Piece) throws -> Self

	/**
	 Retire la piece donnee en parametre de la reserve. Renvoie une erreur si la
   piece n'est pas dans la reserve.

   enleverReserve: Piece x Reserve-> Reserve

   - Precondition: la piece a retirer est dans la reserve.
	*/
	mutating func enleverReserve(_ piece : Piece) throws -> Self

	/**
	 Renvoie Vrai si la reserve est vide. Faux sinon.

   reserveVide: Reserve -> Bool
	*/
	func reserveVide() -> Bool

	/**
	 Renvoie une chaine de caractere contenant le nom des pieces de la reserve separees
   par des virgules si celle si n'est pas vide. Sinon indique que la reserve est vide.

   toStringReserve: Reserve -> String
	*/
	func toStringReserve()-> String

	/**
    Retourne la premiere occurence de la piece dans la reserve correspondant au
    nom donnee en parametre. Renvoie une erreur si les preconditions ne sont pas
    respecte.

    getPieceReserve: String x Reserve -> Piece

    - Precondition :
      - La piece a retourner est dans la reserve.
      - le nom en parametre est soit "kitsune" ou "tanuki" ou "kodama".
	*/
	func getPieceReserve(_ nom : String) throws -> Piece

  /**
    Retourne Vrai si au moin un piece du meme nom que le nom en parametre est dans
    la reserve. Faux Sinon. Renvoie une erreur si la precondition n'est pas respecte

    EstDansReserve: String x Reserve -> Bool

    - Precondition: le nom en parametre est soit "koropokkuru" ou "kitsune" ou "tanuki" ou
                    "kodama".
  */

  func getPiecesReserve() -> [Piece]
  
  // renvoi le tableau de piece
  
  func EstDansReserve(_ nom: String) throws -> Bool

  /**
    Retourne le nombre de pieces de la reserve.

    nbPieceReserve: Reserve -> Int
  */
  func nbPieceReserve() -> Int
  /**
    cree un iterateur sur les pieces de la reserve pour les parcourir
    makeItReserve : Reserve -> ItReserve
 */

  func makeIterator() -> ItReserve
  // renvoie l'iterateur

 /*
  // func reinitialiser()
  // remet le courant de l'iterateur à 0
  
  ajouté par notre groupe

  */

}
