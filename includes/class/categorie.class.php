<?php 
/**
 * 
 */
class categorie extends elements
{
	private $parent_id;

	function __construct($id = null, $nom = "", $description = "", $img = "", $parent_id = "")
	{
		# code...
		parent::__construct($id, $nom, $description, $img);
		$this->parent_id = $parent_id;
	}

	function __get($name){
		return $this->$name;
	}
	function __set($name, $value){
		$this->$name = $value;
	}
}