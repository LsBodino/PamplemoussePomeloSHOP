<?php
require "include/appTop.inc.php";
/*
    By Alexis-Mathieu
    Ce fichier s'utilise en combinaison avec le fichier panier2.class.php 
*/
if(empty($_SESSION['cart'])){
    $_SESSION['cart'] = array();
}

// Si un formulaire d'ajout de produit est envoyé
if(!empty($_POST)){    
    // je récupère un objet de type produit
    $product = produit::getById($_POST['productId']);
    // Ainsi que la quantité voulue
    $quantity = $_POST['quantity'];

    // Je créé un objet panier et je lui passe comme argument la variable de session contenant mon panier
    $panier = new panier($_SESSION['cart']);
    // Je rajoute mon produit à mon panier
    $panier->addProduct($product, $quantity);
    // je met à jour la variable de session pour le sauvegarder d'une page à l'autre
    $_SESSION['cart'] = $panier->getCart();
    // Je redirige l'utilisateur
    header("location: panier.php");
    exit;
}

// Je detecte une action voulant supprimer un objet du panier
if($_GET['action'] === "remove"){    
    // je récupère un objet de type produit
    $product = produit::getById($_GET['product']);
    // Je créé un objet panier et je lui passe comme argument la variable de session contenant mon panier
    $panier = new panier($_SESSION['cart']);
    // Je supprime le produit du panier
    $panier->removeProduct($product);
    // je met à jour la variable de session pour le sauvegarder d'une page à l'autre
    $_SESSION['cart'] = $panier->getCart();
    // Je redirige l'utilisateur
    header("location: panier.php");
    exit;
}