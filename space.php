<?php

require "includes/appTop.inc.php";

if (!$login) {
	# code...
	header("Location: index.php");
	exit;
}

$smarty->assign("login", $login);
$smarty->assign("commandes", manager::getAllCommandeUtilisateur($_SESSION['id']));
$smarty->display('templates/space.tpl');
