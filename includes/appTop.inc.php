<?php 



require_once 'libs/Autoloader.php';
Smarty_Autoloader::register();

require_once 'includes/Autoloader.php';
Autoloader::register();

session_start();

if(!isset($_SESSION['panier'])){
	$_SESSION['panier'] = array();
}

include 'db.php';
database::createConnexion();
$smarty = new Smarty;
$smarty->debugging = true;
$userLogin = null;
if(!empty($_SESSION["login"]) && !empty($_SESSION["mdp"]) && !empty($_SESSION["name"])){
	$login = true;
	$userLogin = session::sessionVersUser();
} 

$smarty->assign("userLogin", $userLogin);
$smarty->assign("categories", manager::getAllCategories());
$smarty->assign("login", $login);
$msg = "";
if(!empty($_GET['panier'])){
	switch ($_GET['panier']) {
		case 'addOk':
			# code...
			$msg = "Le produit a bien été ajouté";
			break;
		case 'delOk':
			# code...
			$msg = "Le produit a bien été supprimé";
			break;
		default:
			# code...
			$msg = "Une erreur est intervenue";
			break;
	}
	$smarty->assign("msgtype", $_GET['panier']);
}	

$smarty->assign("msgPanier", $msg);