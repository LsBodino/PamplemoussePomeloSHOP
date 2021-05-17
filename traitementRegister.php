<?php 

require "includes/appTop.inc.php";

database::Inscription();

header("Location: /index.php");

?>