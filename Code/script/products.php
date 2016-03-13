<?php

require '../config/config.php'; 

$id = intval($_GET['id']);
$idCodeBarre = intval($_GET['idCodeBarre']);

if($idCodeBarre == null){
	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	 $sql="SELECT `ID`, `REFERENCE`, `CODE`, `CODETYPE`, `NAME`, `PRICEBUY`, `PRICESELL`, `CATEGORY`, `PROVIDER`, `TAXCAT`,
	  `ATTRIBUTESET_ID`, `STOCKCOST`, `STOCKVOLUME`, `ATTRIBUTES` FROM products WHERE `CATEGORY`='".$id."'";
	 $data = $pdo->query($sql);
	 $data->setFetchMode(PDO::FETCH_ASSOC);
	 $products= array();

	   foreach($data as $row)
	{
		$product = array('ID' => $row['ID'], 'REFERENCE' => $row['REFERENCE'], 'CODE' => $row['CODE'], 'CODETYPE' => $row['CODETYPE'], 'NAME' => $row['NAME'], 'PRICEBUY' => $row['PRICEBUY'], 'PRICESELL' => $row['PRICESELL'], 'CATEGORY' => $row['CATEGORY'], 'PROVIDER' => $row['PROVIDER'], 'TAXCAT' => $row['TAXCAT'], 'ATTRIBUTESET_ID' => $row['ATTRIBUTESET_ID'], 'STOCKCOST' => $row['STOCKCOST'], 'STOCKVOLUME' => $row['STOCKVOLUME'], 'ATTRIBUTES' => $row['ATTRIBUTES']);
		array_push($products, $product);
		print "<li><a href='#'>". $row['NAME'] ." </a></li>";
	}
}
if($id == null){
	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	 $sql="SELECT * FROM products WHERE `CODE` LIKE '%".$idCodeBarre."%'";
	 $data = $pdo->query($sql);
	 $data->setFetchMode(PDO::FETCH_ASSOC);

	 $products= array();

	 header('Content-type: image/jpeg');
	 header('Content-transfer-encoding: binary');

	   foreach($data as $row)
	{
		$product = array('ID' => $row['ID'], 'REFERENCE' => $row['REFERENCE'], 'CODE' => $row['CODE'], 'CODETYPE' => $row['CODETYPE'], 'NAME' => $row['NAME'], 'PRICEBUY' => $row['PRICEBUY'], 'PRICESELL' => $row['PRICESELL'], 'CATEGORY' => $row['CATEGORY'], 'PROVIDER' => $row['PROVIDER'], 'TAXCAT' => $row['TAXCAT'], 'ATTRIBUTESET_ID' => $row['ATTRIBUTESET_ID'], 'STOCKCOST' => $row['STOCKCOST'], 'STOCKVOLUME' => $row['STOCKVOLUME'], 'ATTRIBUTES' => $row['ATTRIBUTES']);
		array_push($products, $product);
		print "<li>   <a href='#' onclick=''> <img src='data:image/jpeg;base64,".base64_encode($row['IMAGE'])."' width='50'> - ".$row['NAME']." </a></li>";
	}
}

?>