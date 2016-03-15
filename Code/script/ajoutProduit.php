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
/*$sql="INSERT INTO `".$dernierebase."`.`ticket_line` (`id`, `ticket_id`, `product_id`, `attributesetinstance_id`, `tax_id`, `line`, `quantity`, `price`, `discount_rate`, `attributes`, `product_label`) 
	VALUES (NULL, '".$idticket."', '".$idProduct."', '1', '1', '1', '1', '5', '0', NULL, NULL);";*/
	$sql="INSERT INTO `".$dernierebase."`.`ticket_line` (`id`, `ticket_id`, `product_id`, `attributesetinstance_id`, `tax_id`, `line`, `quantity`, `price`, `discount_rate`, `attributes`, `product_label`) 
	VALUES (:id, :idticket,:idproduct, :i, :tax, :line, :quantity, :price, :discount, :attribut, :product);";
$data = $pdo->prepare($sql);
$data->execute(array(
    "id" => "NULL",
    "idticket" => $idticket,
    "idproduct" => $idProduct,
    "i" => "1",
    "tax" => "1",
    "line" => "1",
    "quantity" => "1",
    "price" => "1",
    "discount" => "0",
    "attribut" => "NULL",
    "product" => "NULL"
));

header('Location: ' . $_SERVER['HTTP_REFERER'] );


?>