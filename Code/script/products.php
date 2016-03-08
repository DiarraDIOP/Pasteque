<?php

require '../config/config.php'; 

$id = intval($_GET['id']);
$idCodeBarre = intval($_GET['idCodeBarre']);

if($idCodeBarre == null){
	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	 $sql="SELECT `ID`, `REFERENCE`, `CODE`, `CODETYPE`, `NAME`, `PRICEBUY`, `PRICESELL`, `CATEGORY`, `PROVIDER`, `TAXCAT`,
	  `ATTRIBUTSET_ID`, `STOCKCOST`, `STOCKVOLUME`, `ATTRIBUTES` FROM products WHERE `CATEGORY`=".$id;
	 $data = $pdo->query($sql);
	 $data->setFetchMode(PDO::FETCH_ASSOC);
	 $products= array();

	   foreach($data as $row)
	{
		$product = array('ID' => $row['ID'], 'REFERENCE' => $row['REFERENCE'], 'CODE' => $row['CODE'], 'CODETYPE' => $row['CODETYPE'], 'NAME' => $row['NAME'], 'PRICEBUY' => $row['PRICEBUY'], 'PRICESELL' => $row['PRICESELL'], 'CATEGORY' => $row['CATEGORY'], 'PROVIDER' => $row['PROVIDER'], 'TAXCAT' => $row['TAXCAT'], 'ATTRIBUTSET_ID' => $row['ATTRIBUTSET_ID'], 'STOCKCOST' => $row['STOCKCOST'], 'STOCKVOLUME' => $row['STOCKVOLUME'], 'ATTRIBUTES' => $row['ATTRIBUTES']);
		array_push($products, $product);
		print "<li><a href='#'>". $row['NAME'] ." </a></li>";
	}
}
if($id == is_null){
	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	 $sql="SELECT `ID`, `REFERENCE`, `CODE`, `CODETYPE`, `NAME`, `PRICEBUY`, `PRICESELL`, `CATEGORY`, `PROVIDER`, `TAXCAT`,
	  `ATTRIBUTSET_ID`, `STOCKCOST`, `STOCKVOLUME`, `ATTRIBUTES` FROM products WHERE `CODE`=".$idCodeBarre;
	 $data = $pdo->query($sql);
	 $data->setFetchMode(PDO::FETCH_ASSOC);
	 $products= array();

	   foreach($data as $row)
	{
		$product = array('ID' => $row['ID'], 'REFERENCE' => $row['REFERENCE'], 'CODE' => $row['CODE'], 'CODETYPE' => $row['CODETYPE'], 'NAME' => $row['NAME'], 'PRICEBUY' => $row['PRICEBUY'], 'PRICESELL' => $row['PRICESELL'], 'CATEGORY' => $row['CATEGORY'], 'PROVIDER' => $row['PROVIDER'], 'TAXCAT' => $row['TAXCAT'], 'ATTRIBUTSET_ID' => $row['ATTRIBUTSET_ID'], 'STOCKCOST' => $row['STOCKCOST'], 'STOCKVOLUME' => $row['STOCKVOLUME'], 'ATTRIBUTES' => $row['ATTRIBUTES']);
		array_push($products, $product);
		print "<li><a href='#'>". $row['NAME'] ." </a></li>";
	}
}

?>