<?php 
/**
 * 
 */
class elements
{
	protected $id;
	protected $nom;
	protected $description;
	protected $img;

	function __construct($id, $nom, $description, $img)
	{
		# code...
		$this->id = $id;
		$this->nom = $nom;
		$this->description = $description;
		$this->img = $img;
	}


	function __get($name){
		return $this->$name;
	}
	function __set($name, $value){
		$this->$name = $value;
	}	
}