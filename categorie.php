<?php

require "includes/appTop.inc.php";

$cat = $_GET['id'];
if(empty($cat)){
	header("location: ../index.php");
	exit;
}
$Produits = manager::getProduitParCategorie($cat);
if(empty($Produits)){
	header("location: ../index.php");
	exit;
}

$smarty->assign("login", $login);
$smarty->assign("Produits", $Produits);
$smarty->display('templates/categorie.tpl');