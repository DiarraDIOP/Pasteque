<?php

require '../config/config.php'; 

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
$string = "";
 for ($i = 0; $i < 32; $i++) {
      $string .= $characters[rand(0, strlen($characters) - 1)];
 }

 $id = $string;
	 $sql="SELECT MAX(`TICKETID`) FROM tickets ;";
	 $ticket = $pdo->query($sql);
	 $ticket->setFetchMode(PDO::FETCH_ASSOC);
	
	  foreach($ticket as $row)
	{
		$i=intval($row['TICKETID'])+1;
	 $insert= $pdo->query("INSERT INTO ".$dernierebase.".tickets (`ID`, `TICKETTYPE`, `TICKETID`, `PERSON`, `CUSTOMER`, `STATUS`, `CUSTCOUNT`, `TARIFFAREA`, `DISCOUNTRATE`, `DISCOUNTPROFILE_ID`) VALUES ('".$id."', '0', '".$i."', '', NULL, '0', NULL, NULL, '0', NULL);");

	 header('Location: ../pages/caisse.html' );
	}
?>