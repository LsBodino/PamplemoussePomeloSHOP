<?php

require "includes/appTop.inc.php";

$id = $_GET['id'];

panier::delProduit($id);

header("Location: panier?panier=delOk");
exit;