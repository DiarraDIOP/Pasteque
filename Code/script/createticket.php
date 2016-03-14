<?php

require '../config/config.php'; 

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
$string = "";
 for ($i = 0; $i < 32; $i++) {
      $string .= $characters[rand(0, strlen($characters) - 1)];
 }

 $id = $string;
	 $sql="SELECT MAX(`RECEIPT_ID`) FROM ticket ;";
	 $ticket = $pdo->query($sql);
	 $ticket->setFetchMode(PDO::FETCH_ASSOC);
	
	  foreach($ticket as $row)
	{
		$i=intval($row['RECEIPT_ID'])+1;
	 $insert= $pdo->query("INSERT INTO ".$dernierebase.".ticket (`ID`, `TYPE`, `RECEIPT_ID`, `USER_ID`, `CUSTOMER_ID`, `STATUS`, `CUSTOMER_COUNT`, `TARIFFAREA_ID`, `DISCOUNT_RATE`, `DISCOUNTPROFILE_ID`) VALUES ('".$id."', '0', '".$i."', '', NULL, '0', NULL, NULL, '0', NULL);");

	 header('Location: ../pages/caisse.html' );
	}
?>