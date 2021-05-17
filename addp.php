<?php

require "includes/appTop.inc.php";

$id = $_POST['idProduit'];
$qte = $_POST['qteProduit'];
$stock = $_POST['stockProduit'];
if($stock >= $qte){
    panier::addProduit(manager::getById($id), $qte);
    header("Location: produit?id=".$id."&panier=addOk");
    exit;
}else{
    header("Location: index");
    exit;
}