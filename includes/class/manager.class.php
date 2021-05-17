<?php 
/**
 * 
 */
class manager
{
	static function getAllCategories()
	{
		# code...
		return database::selectAll("categorie");
	}
	static function getAllproduits()
	{
		# code...
		return database::selectAll("produit");
	}
	static function getProduitParCategorie($categorie_id, $idToIgnore = 0)
	{
		# code...

		$arrayToReturn = array();
		foreach (database::selectAll("produit") as $product) {
			# code...
			if($product['categorie_id'] == $categorie_id){
				if($product['id'] != $idToIgnore)
					$arrayToReturn[] = $product;
			}
		}
		return $arrayToReturn;
	}

	static function createCommande($panier, $user){
		return database::createCommande($user, $panier);
	}

	static function getById($id, $table = "produit", $comportement = PDO::FETCH_OBJ){
		foreach (database::selectAll($table, $comportement) as $element) {
			if($element->id == $id){
				return $element;
				break;
			}
		}
		return null;
	}

	static function getAllCommandeUtilisateur($idUtilisateur){
		$arrayToReturn = array();
		foreach(database::selectAll("commande") as $commande){
			if($commande['user_id'] == $idUtilisateur){
				$arrayToReturn[] = $commande;
			}
		}
		return $arrayToReturn;
	}

	static function recupProduits($idCommande){
		$arrayToReturn = array();
		foreach(database::selectAll("produitcommande") as $produitcommande){
			if($produitcommande['commande_id'] == $idCommande){
				$arrayToReturn[] = $produitcommande;
			}
		}
		return $arrayToReturn;
	}
}