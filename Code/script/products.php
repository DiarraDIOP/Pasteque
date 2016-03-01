<?php

require '../config/config.php'; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="SELECT `ID`, `REFERENCE`, `CODE`, `CODETYPE`, `NAME`, `PRICEBUY`, `PRICESELL`, `CATEGORY`, `PROVIDER`, `TAXCAT`,
  `ATTRIBUTSET_ID`, `STOCKCOST`, `STOCKVOLUME`, `ATTRIBUTES` FROM products";
 $data = $pdo->query($sql);
 $data->setFetchMode(PDO::FETCH_ASSOC);
 $products= array();

   foreach($data as $row)
{
	$product = array('ID' => $row['ID'], 'REFERENCE' => $row['REFERENCE'], 'CODE' => $row['CODE'], 'CODETYPE' => $row['CODETYPE'], 'NAME' => $row['NAME'], 'PRICEBUY' => $row['PRICEBUY'], 'PRICESELL' => $row['PRICESELL'], 'CATEGORY' => $row['CATEGORY'], 'PROVIDER' => $row['PROVIDER'], 'TAXCAT' => $row['TAXCAT'], 'ATTRIBUTSET_ID' => $row['ATTRIBUTSET_ID'], 'STOCKCOST' => $row['STOCKCOST'], 'STOCKVOLUME' => $row['STOCKVOLUME'], 'ATTRIBUTES' => $row['ATTRIBUTES']);
	array_push($products, $product);
}

?>