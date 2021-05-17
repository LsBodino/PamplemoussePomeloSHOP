<?php 
class panier 
{
	static function getProduits(){
		return $_SESSION['panier'];
	}
	static function prixTotal(){
		$prixTotal = 0;
		foreach (self::getProduits() as $product) {
			$prixTotal += $product[0]->prix * $product[1];
		}
		return $prixTotal;
	}
	// ajouter produit
		static function addProduit($produit, $qte){
		$key = self::rechercheProduit($produit->id);
		if($key !== false){
			$_SESSION['panier'][$key][1] += $qte;
		} else {
				array_push($_SESSION['panier'], array($produit, $qte)); 	
		}
	}

	// Cette fonction supprime la ligne du panier dont l'id du produit est passé en argument
	static function delProduit($idProduit){
		$key = self::rechercheProduit($idProduit);
			if($key !== false){
			unset($_SESSION['panier'][$key]);
		} 	
	}
	static function setQte($idProduit, $qte){
		// je cherche la bonne ligne dans le panier
		$key = self::rechercheProduit($idProduit);
		// Si la fonction trouve une ligne correspondante dans le panier il modifie sa quantité dans le panier sinon il ne fait rien
		if($key !== false){
			$_SESSION['panier'][$key][1] = $qte;
		}	
	}
		static function rechercheProduit($idProduit){
		$keyToReturn = false;
		foreach (self::getProduits() as $key => $value) {
				if($value[0]->id == $idProduit){
				$keyToReturn = $key;
					break;
			}
		}
		return $keyToReturn;
	}
}