<?php

require '../config/config.php'; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="SELECT `ID`, `CODE`, `NAME`, `BACK_NAME`, `FLAGS`, `ACTIVE`, `SYSTEM`, `DISPLAY_ORDER` FROM payment_modes";
 $data = $pdo->query($sql);
 $data->setFetchMode(PDO::FETCH_ASSOC);
 $products= array();

   foreach($data as $row)
{
	$product = array('ID' => $row['ID'], 'CODE' => $row['CODE'],  'NAME' => $row['NAME'], 'BACK_NAME' => $row['BACK_NAME'], 'FLAGS' => $row['FLAGS'], 'ACTIVE' => $row['ACTIVE'], 'SYSTEM' => $row['SYSTEM'], 'DISPLAY_ORDER' => $row['DISPLAY_ORDER']);
	array_push($products, $product);
}

?>