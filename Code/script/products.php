<?php

require '../config/config.php'; 

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$id = $_GET['id'];
	
	 $sql="SELECT `ID`, `REFERENCE`, `CODE`, `CODETYPE`, `NAME`, `PRICEBUY`, `PRICESELL`, `CATEGORY`, `PROVIDER`, `TAXCAT`,
	  `ATTRIBUTESET_ID`, `STOCKCOST`, `STOCKVOLUME`, `ATTRIBUTES` FROM products WHERE `CATEGORY`='".$id."';";
	 $data = $pdo->query($sql);
	 $data->setFetchMode(PDO::FETCH_ASSOC);
	 $products= array();

	   foreach($data as $row)
	{
		
		/*print "<li><a href='#' onclick='showTicket(\"".htmlspecialchars($row['ID'],ENT_QUOTES)."\")'>". $row['NAME'] ." </a></li>";
		
		print "<li><a href='#' onclick='showTicket(\"03498afd5fa28959f5975453ec8e3510\")'>". $row['NAME'] ." </a></li>";*/
		print "<li><a href='#' onclick='addProduct(\"03498afd5fa28959f5975453ec8e3510\",\"001fac7d089d2af3c546448f3ffcbe8f\")'>". $row['NAME'] ." </a></li>";
	}

?>