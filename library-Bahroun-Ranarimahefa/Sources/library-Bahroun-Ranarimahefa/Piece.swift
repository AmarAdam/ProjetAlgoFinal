fileprivate class Piece {  
		
  // gestion d'erreur

  var nom : String 
  var position : Int?

  enum GestionErrorPiece: Error {
    case invalidKodama
}

	
	/* on utilise des class, parce que les class gèrent les types par pointage et les structures gèrent par référence
	*  ainsi on pour utiliser nos fonctions en notation pointé 
	*  
	* aucun mutating dans les class, swift ne les prend pas en compte
    */	
	
	/**
  Une piece possede un nom et une position sur le plateau. Si la piece est dans
  la reserve alors sa position est vide.
  Ce protocol sera implemente par un type nomme Piece.
  */
 
   /**
   Cree une piece avec un nom et une position sur le plateau. La piece est creee
   avec un nom et est initialise sur une position du plateau de jeu.

   creerPiece: String x position -> Piece

  - Postcondition :
    - la piece creee possede un nom.
    - la piece creee possede une position.
  */
  
  init(_ nom : String , _ position : Int ) {
	
	self.nom = nom
	self.position = position      // vide si dans la reserve 
  	
  }

  /**
   Retourne le nom de la piece en parametre.

   getNomPiece: Piece -> String

   - Postcondition : le nom est soit "koropokkuru" ou  "kitsune" ou soit "tanuki"
                     ou "kodama" ou "kodama samurai".
  */
  
  func getNomPiece() -> String {
  	return self.nom 
  }

  /**
   Modifie le nom de la piece en parametre.

   setNomPiece : String x Piece -> Piece

   - Precondition : les noms de pieces possibles sont "koropokkuru" ou "kitsune"
                    ou "tanuki" ou "kodama" ou "kodama samurai".
  */
  
  func setNomPiece(_ nom : String) {
  	self.nom = nom 
  }

  /**
   Retourne la position de la piece en parametre sur le plateau. Renvoie vide si
   la piece n'est pas sur le plateau.

   getPosition : Piece -> (Int | Vide)

   - Postcondition: La position renvoyee doit être compris entre 0 et la longueur maximal * largeur maximal du plateau
                    si la piece est sur le plateau. La position renvoyee est vide si la piece n'est pas sur le plateau.
  */
  
  func getPosition()-> Int? {
  	return self.position
  }

  /**
   Renvoie Vrai si la piece en parametre est un koropokkuru. Faux sinon

   estRoi : Piece -> Bool
  */
  
  func estRoi() -> Bool {
  	
  	if self.getNomPiece() == "koropokkuru" {
  		return true 
  	}
  	else {
  		return false
  	}
  }

  /**
   Renvoie Vrai si la piece en parametre est un kodama. Faux sinon.

   estKodama: Piece -> Bool
   */
  
  func estKodama() -> Bool {
  	
  	if self.getNomPiece() == "kodama" {
  		return true 
  	}
  	else {
  		return false
  	}
  }

  /**
   Renvoie Vrai si la piece en parametre est un kodama samurai. Faux sinon.

   estKodamaSamurai: Piece -> Bool
  */
  
  func estKodamaSamurai() -> Bool {
  	
  	if self.getNomPiece() == "kodama samurai" {
  		return true 
  	}
  	else {
  		return false
  	}
  }

  /**
   Modifie la piece en parametre en kodama samurai. Renvoie une erreur si la piece
   en entree n'est pas un kodama.

   transformerEnKodamaSamurai: Piece -> Piece

   - Precondition:
      - la piece a transformer doit etre un kodama.
      - le kodama doit etre dans la zone de promotion du joueur adverse.
      - la transformation est faisable uniquement apres le deplacement de la piece.
  */
  func transformerEnKodamaSamurai() throws {

  }

  /**
    Modifie la piece en parametre en kodama. Renvoie une erreur si la piece en
    entree n'est pas un kodama.

    transformerEnKodama: Piece -> Piece

    - Precondition:
      - la piece a transormer doit etre un kodama samurai.
      - la transformation s'effectue apres la capture de la piece par l'adversaire.
  */
  
  func transformerEnKodama() throws -> Piece {
	
	guard self.estKodama() else {
  		self.setNomPiece("kodama")
  	}
  	else throws {
  		GestionErrorPiece.invalidKodama
  	}
  }

}
