 <?php

require '../config/config.php'; 

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$id = $_GET['id'];
	
	 $sql="SELECT `ID`, `REFERENCE`, `BARCODE`, `BARCODE_TYPE`, `NAME`, `PRICE_BUY`, `PRICE_SELL`, `CATEGORY_ID`, `PROVIDER_ID`, `TAXCATEGORY_ID`,
	  `ATTRIBUTESET_ID`, `STOCK_COST`, `STOCK_VOLUME`, `ATTRIBUTES`,`IMAGE` FROM product WHERE `CATEGORY_ID`='".$id."';";
	 $data = $pdo->query($sql);
	 $data->setFetchMode(PDO::FETCH_ASSOC);
	 $products= array();

	   foreach($data as $row)
	{		
		/*print "<li><a href='#' onclick='showTicket(\"".htmlspecialchars($row['ID'],ENT_QUOTES)."\")'>". $row['NAME'] ." </a></li>";
		
		print "<li><a href='#' onclick='showTicket(\"03498afd5fa28959f5975453ec8e3510\")'>". $row['NAME'] ." </a></li>";*/
		print "<li><a href='#' onclick='addProduct(1,11)'><img src='data:image/jpeg;base64,".base64_encode($row['IMAGE'])."' width='50'>". $row['NAME'] ." </a></li>";
	}

?>
