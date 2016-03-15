<?php

require '../config/config.php'; 


	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	 //variable globale avec l'ID de la caisse 
	 $idcaisse = 0;

	 //insérer un nouveau recu dans caisse nouvellement créée
	 $pdo->query("INSERT INTO ".$dernierebase.".`receipt` (`id`, `cash_id`, `display_id`, `date`, `attributes`) VALUES (NULL, '".$idcaisse."', '', '', NULL);");   
	  $idreceipt = mysql_insert_id();

	 //insérer un ticket dans le recu créé avec le statut 1 => ouvert, 0=>fermé
	  $pdo->query("INSERT INTO ".$dernierebase.".`ticket` (`id`, `receipt_id`, `user_id`, `customer_id`, `tariffarea_id`, `discountprofile_id`, `type`, `date`, `status`, `customer_count`, `discount_rate`) VALUES (NULL, '".$idreceipt."', NULL, NULL, NULL, NULL, '', NULL, '1', NULL, '');");
      $idticket = mysql_insert_id();

	 header('Location: ../pages/caisse.html');
?>
