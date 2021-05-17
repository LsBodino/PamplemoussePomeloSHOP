<?php 
/**
 * 
 */
class session
{
	static function sessionVersUser(){
		return new user($_SESSION["login"], $_SESSION["mdp"], $_SESSION["name"], $_SESSION["id"]);
	}
}