<?php 
/**
 * 
 */
class user
{
	private $id;
	private $login;
	private $name;
	private $mdp;

	

	function __construct($login = "", $mdp = "", $name = "", $id = null)
	{
		# code...
		$this->id = $id;
		$this->name = $name;
		$this->login = $login;
		$this->mdp = $mdp;
	}

	function __get($name){
		return $this->$name;
	}

	function __set($name, $value){
		$this->$name = $value;
	}

	function login(){
		foreach (database::selectAll("user") as $user) {
			# code...
			if($user['login'] == $this->login){
				$this->name = $user['name'];
				$this->id = $user['id'];
				if(password_verify($this->mdp, $user['mdp'])){
					$this->mdp = $user['mdp'];
				return true;
				}
			}
		}
		return false;
	}
}