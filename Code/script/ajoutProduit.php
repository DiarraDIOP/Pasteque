<?php

require '../config/config.php'; 

$idTicket = $_GET['idTicket'];
$idProduct = $_GET['idProduit'];

$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$sql = $pdo->query("INSERT INTO ".$dernierebase.".`ticket_line` (`id`, `ticket_id`, `product_id`, `attributesetinstance_id`, `tax_id`, `line`, `quantity`, `price`, `discount_rate`, `attributes`, `product_label`) VALUES (NULL, '".$idTicket."', '".$idProduct."', NULL, NULL, '', '', '', '', NULL, NULL);");
	header('Location: ../pages/caisse.html');

?>