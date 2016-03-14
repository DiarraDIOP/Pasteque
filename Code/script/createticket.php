<?php

require '../config/config.php'; 

/*
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

function randomAlphaID($int){
	$characters = "abcdefghijklmnopqrstuvwxyz0123456789";
	$string = "";
	 for ($i = 0; $i < $int; $i++) {
	      $string .= $characters[rand(0, strlen($characters) - 1)];
	 }
	 return $string;
}

function randomID($int){
	$characters = "0123456789";
	$string = "";
	 for ($i = 0; $i < $int; $i++) {
	      $string .= $characters[rand(0, strlen($characters) - 1)];
	 }
	 return $string;
}
 	
 	 $id = randomID(32);
	 $sql="SELECT MAX(`TICKETID`) as 'idt' FROM tickets ;";
	 $ticket = $pdo->query($sql);
	 $ticket->setFetchMode(PDO::FETCH_ASSOC);
	
	if($row = $ticket->fetch()){
		$i=intval($row['idt'])+1;
		print $id."       -            ";
		print $i;

		//insertion closecash

		$cc="SELECT MAX(`HOTSEQUENCE`) as 'idt' FROM closedcash ;";
		$ccash = $pdo->query($cc);
		$ccash->setFetchMode(PDO::FETCH_ASSOC);
		$pdo->query("INSERT INTO ".$dernierebase.".closedcash (`MONEY`, `CASHREGISTER_ID`, `HOSTSEQUENCE`, `DATESTART`, `DATEEND`, `OPENCASH`, `CLOSECASH`, `EXPECTEDCASH`) VALUES ('".randomAlphaID(36)."', '1', '".randomID(3)."', NULL, NULL, NULL, NULL, NULL)");
		
		//insertion receipt
		//à modifier

		$sql2="SELECT MAX(`HOTSEQUENCE`) as 'idt' FROM closedcash ;";
		$ccash = $pdo->query($sql2);
		$ccash->setFetchMode(PDO::FETCH_ASSOC);
		$pdo->query("INSERT INTO ".$dernierebase.".closedcash (`MONEY`, `CASHREGISTER_ID`, `HOSTSEQUENCE`, `DATESTART`, `DATEEND`, `OPENCASH`, `CLOSECASH`, `EXPECTEDCASH`) VALUES ('".randomAlphaID(36)."', '1', '".randomID(3)."', NULL, NULL, NULL, NULL, NULL)");
		

		$pdo->query("INSERT INTO ".$dernierebase.".tickets (`ID`, `TICKETTYPE`, `TICKETID`, `PERSON`, `CUSTOMER`, `STATUS`, `CUSTCOUNT`, `TARIFFAREA`, `DISCOUNTRATE`, `DISCOUNTPROFILE_ID`) VALUES ('".$id."', '0', '".$i."', '', NULL, '0', NULL, NULL, '0', NULL);");

	 //header('Location: ../pages/caisse.html' );
	}*/
?>

