<?php

require '../config/config.php'; 

$idcaisse = $_GET['idCaisse']; //ou variable globale id caisse

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	 //if du nb tickets ouverts à tester d'abord
	 //modifier le statut de la caisse à "fermé"
	  $pdo->query("UPDATE ".$dernierebase.".`cash` SET `open_cash` = '0', `close_cash` = '1' WHERE `cash`.`id` = ".$idcaisse.";");

      $idticket = mysql_insert_id();

	 header('Location: ../pages/index.html'); //renvoi vers ticket.html avec les Stock restant
?>
