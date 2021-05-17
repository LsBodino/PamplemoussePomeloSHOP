<?php

require "includes/appTop.inc.php";

$panier = array(
			array(manager::getById(1), 2),
			array(manager::getById(14), 5),
			array(manager::getById(9), 1)
		);
$panier = panier::getProduits();
$pu = panier::prixTotal();

$smarty->assign("pu", $pu);
$smarty->assign("login", $login);
$smarty->assign("panier", $panier);
$smarty->display('templates/panier.tpl');