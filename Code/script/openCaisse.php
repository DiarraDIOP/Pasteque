<?php

require '../config/config.php'; 

session_start();

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	 //insérer une caisse ouverte open_cash=1 close_cash=0
	 $pdo->query("INSERT INTO ".$dernierebase.".`cash` (`id`, `cashregister_id`, `money`, `host_sequence`, `open_date`, `close_date`, `open_cash`, `close_cash`, `expected_cash`) VALUES (NULL, '1', '', '', '', '', '1', '0', NULL);");

	 //insérer un recu dans caisse nouvellement créée
	 //mysql_insert_id() ==> dernier id générée 
	 $idcaisse = $pdo->lastInsertId();

	 $_SESSION['id_caisse'] = $idcaisse;
	 $pdo->query("INSERT INTO ".$dernierebase.".`receipt` (`id`, `cash_id`, `display_id`, `date`, `attributes`) VALUES (NULL, '".$idcaisse."', '', '', NULL);");

	 //insérer un ticket dans le recu créé avec le statut 1 => ouvert, 0=>fermé
	  $idreceipt = $pdo->lastInsertId();

	  $pdo->query("INSERT INTO ".$dernierebase.".`ticket` (`id`, `receipt_id`, `user_id`, `customer_id`, `tariffarea_id`, `discountprofile_id`, `type`, `date`, `status`, `customer_count`, `discount_rate`) VALUES (NULL, '".$idreceipt."', NULL, NULL, NULL, NULL, '', NULL, '1', NULL, '');");
      $idticket = $pdo->lastInsertId();

	 header('Location: ../pages/caisse.html');
?>
