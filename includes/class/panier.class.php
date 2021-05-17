<?php 
class panier 
{
	static function getProduits(){
		return $_SESSION['panier'];
	}
	static function prixTotal(){
		// si le panier est vide, la fonction ne rentrera pas dans la boucle, donc la fonction doit renvoyer un nombre null donc 0
		$prixTotal = 0;
		// pour chaque élément du panier récupérer grâce à la fonction getProduits
		foreach (self::getProduits() as $product) {
			# code...
			// $product[0] = produits
			// $product[1] = qté
			// Je rajoute le prix du produit multiplié par la quantité
			$prixTotal += $product[0]->prix * $product[1];
		}
		//je renvoi le prix calculé 
		return $prixTotal;
	}
	// ajouter produit
	// Cette fonction ajoute un tableau avec 2 cases la première contient un objet de type produit et la seconde la quantité
	static function addProduit($produit, $qte){
		$key = self::rechercheProduit($produit->id);
		if($key !== false){
			$_SESSION['panier'][$key][1] += $qte;
		} else {
			// Sinon je le rajoute
			array_push($_SESSION['panier'], array($produit, $qte)); 	
		}
	}

	// Cette fonction supprime la ligne du panier dont l'id du produit est passé en argument
	static function delProduit($idProduit){
		// je cherche la bonne ligne dans le panier
		$key = self::rechercheProduit($idProduit);
		// Si la fonction trouve une ligne correspondante dans le panier il la supprime sinon il ne fait rien
		if($key !== false){
			unset($_SESSION['panier'][$key]);
		} 	
	}

	// Cette fonction cherche la clé de tableau correspondant au produit dont l'id est passé en parametre
	static function rechercheProduit($idProduit){
		$keyToReturn = false;
		// Pour chaque ligne du panier
		foreach (self::getProduits() as $key => $value) {
			# code...
			// Je regarde si l'id que je cherche correpsond à l'id du produit
			if($value[0]->id == $idProduit){
				$keyToReturn = $key;
				// Si je trouve j'arrete la boucle
				break;
			}
		}
		// je renvoi la clé de l'élément qui m'intéresse
		return $keyToReturn;
	}
}