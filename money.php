<?php 

require "includes/appTop.inc.php";

$user = manager::getById($_SESSION['id'], "user");
$panier = $_SESSION['panier'];

if(manager::createCommande($panier, $user)){
	unset($_SESSION['panier']);
	header("Location: panier.php");
} else {
	header("Location: panier.php?error");
}
?>