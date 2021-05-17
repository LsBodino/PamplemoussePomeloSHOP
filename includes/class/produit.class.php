<?php 
/**
 * 
 */
class produit extends elements
{
	private $prix;
	private $stock;
	private $categorie_id;

	function __construct($id = null, $nom = "", $description = "", $img = "", $prix = 0, $stock = 0, $categorie_id = null)
	{
		parent::__construct($id, $nom, $description, $img);
		$this->prix = $prix;
		$this->stock = $stock;
		$this->categorie_id = $categorie_id;
	}

	function __get($name){
		return $this->$name;
	}
	function __set($name, $value){
		$this->$name = $value;
	}

	
}