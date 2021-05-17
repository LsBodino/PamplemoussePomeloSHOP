<?php 
/**
 * 
 */
class produit extends elements
{
	private $prix;
	private $stock;
	private $categorieId;

	function __construct($id = null, $nom = "", $description = "", $img = "", $prix = 0, $stock = 0, $categorieId = null)
	{
		parent::__construct($id, $nom, $description, $img);
		$this->prix = $prix;
		$this->stock = $stock;
		$this->categorieId = $categorieId;
	}

	function __get($name){
		return $this->$name;
	}
	function __set($name, $value){
		$this->$name = $value;
	}

	
}