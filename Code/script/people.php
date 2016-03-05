<?php

require '../config/config.php'; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="SELECT `ID`, `NAME`, `APPPASSWORD`, `CARD`, `ROLE`, `VISIBLE` FROM people";
 $data = $pdo->query($sql);
 $data->setFetchMode(PDO::FETCH_ASSOC);
 $products = array();
 $n = 0;

   foreach($data as $row) {
   		$product = array('ID' => $row['ID'], 'NAME' => $row['NAME'],  'APPPASSWORD' => $row['APPPASSWORD'],'CARD' => $row['CARD'], 'ROLE' => $row['ROLE'], 'VISIBLE' => $row['VISIBLE']);
	array_push($products, $product);
   }

?>