<?php

require '../config/config.php'; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="SELECT `ID`, `CODE`, `NAME`, `BACKNAME`, `FLAGS`, `ACTIVE`, `SYSTEM`, `DISPORDER` FROM paiementmodes";
 $data = $pdo->query($sql);
 $data->setFetchMode(PDO::FETCH_ASSOC);
 $products= array();

   foreach($data as $row)
{
	$product = array('ID' => $row['ID'], 'CODE' => $row['CODE'],  'NAME' => $row['NAME'], 'BACKNAME' => $row['BACKNAME'], 'FLAGS' => $row['FLAGS'], 'ACTIVE' => $row['ACTIVE'], 'SYSTEM' => $row['SYSTEM'], 'DISPORDER' => $row['DISPORDER']);
	array_push($products, $product);
}

?>