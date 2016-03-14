<?php

require '../config/config.php'; 

$ticket=$_GET('idticket');
$idProduct=$_GET('idProduct');

$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
/*$sql="SELECT `TICKET`, `LINE`, `PRODUCT`, `UNITS`, `PRICE`, `TAXID`, `DISCOUNTRATE`, `ATTRIBUTES` 
	FROM ticketlines WHERE `TICKET`='".$ticket."' AND `PRODUCT`='".$idProduct;
$exist=$pdo->query($sql);
*/
/*	$sql="SELECT `ID`, `REFERENCE`, `CODE`, `CODETYPE`, `NAME`, `PRICEBUY`, `PRICESELL`, `CATEGORY`, `PROVIDER`, `TAXCAT`,
	  `ATTRIBUTESET_ID`, `STOCKCOST`, `STOCKVOLUME`, `ATTRIBUTES` FROM products WHERE `ID`='".$idProduct."';";
	$product=$pdo->query($sql);

	foreach($product as $row){
		$priceProduct=$row['PRICE'];
		$sql1="SELECT `RATE` FROM taxes WHERE `CATEGORY`='".$row['TAXCAT']."';";
		$taxe=$pdo->query($sql1);
		
	}*/

	$sql="INSERT INTO ".$dernierebase.".ticketlines (`TICKET`, `LINE`, `PRODUCT`, `UNITS`, `PRICE`, `TAXID`, `DISCOUNTRATE`, `ATTRIBUTES`) 
	VALUES ('".$ticket."', NULL, '".$idProduct."', '1', '0', '000', '0', '0')";
$data = $pdo->query($sql);

header('Location: ' . $_SERVER['HTTP_REFERER'] );


?>