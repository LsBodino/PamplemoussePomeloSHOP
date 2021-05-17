<?php 
/**
 * 
 */
class categorie extends elements
{
	private $parentId;

	function __construct($id = null, $nom = "", $description = "", $img = "", $parentId = "")
	{
		# code...
		parent::__construct($id, $nom, $description, $img);
		$this->parentId = $parentId;
	}

	function __get($name){
		return $this->$name;
	}
	function __set($name, $value){
		$this->$name = $value;
	}
}