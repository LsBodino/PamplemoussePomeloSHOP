<?php 

/**
 * 
 */
class commande
{
	
	private $id;
	private $date;
	private $userId;
	private $produits;

	function __construct(){
		$this->produits = manager::recupProduits($this->id);
	}

	function getPrixHT(){
		$pu = 0;
		foreach ($this->produits as $produit) {
			# code...
			$pu+= $produit['prix']*$produit['qte'];
		}
		return $pu;
	}

	function getTotaux(){
		$pu = $this->getPrixHT();
		$arrayToReturn = array("pu" => $pu);
		return $arrayToReturn;
	}

	function __get($name){
		return $this->$name;
	}
	function __set($name, $value){
		$this->$name = $value;
	}
}