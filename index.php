<?php
require "includes/appTop.inc.php";


$smarty->assign("login", $login);

$smarty->assign("products", manager::getAllproduits());

$smarty->display('templates/index.tpl');
