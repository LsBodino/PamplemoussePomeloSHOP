<?php

require "includes/appTop.inc.php";

$produit = $_GET['id'];
if(empty($produit)){
	header("location: index.php");
	exit;
}
$prod = manager::getById($produit);
$smarty->assign("login", $login);
$smarty->assign("product", $prod);
$smarty->assign("othersProducts", manager::getProduitParCategorie($prod->categorie_id, $prod->id));
$smarty->display('templates/produit.tpl');