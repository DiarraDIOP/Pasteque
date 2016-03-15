<?php

require '../config/config.php'; 

$idTicket = $_GET['idTicket'];

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	 //modifier le statut du ticket à "fermé"
	  $pdo->query("UPDATE ".$dernierebase.".`ticket` t SET t.`status` = '0' WHERE  t.`id` =".$idTicket);

      /*(SELECT distinct t.id FROM `ticket`t,`receipt`r, `cash` c WHERE t.`receipt_id`= r.id AND r.`cash_id` = ".$idcaisse.")*/

      $idticket = mysql_insert_id();

	 header('Location: ../pages/index.html');
?>
