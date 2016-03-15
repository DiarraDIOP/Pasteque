 <?php

require '../config/config.php'; 

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	 $idCat = $_GET['id'];

	 //recup de la dernière caisse ouverte liée au user connecté
	 $sql="SELECT distinct id FROM `cash` WHERE `open_cash`= 1 ";
	 $data = $pdo->query($sql);
	 $data->setFetchMode(PDO::FETCH_ASSOC);	
	 if($row = $data->fetch()){
		$idCaisse = $row['id'];
	 }
	
	 //recup du ticket ouvert dans la caisse
	 $sql="SELECT distinct t.id FROM `ticket`t,`receipt`r, `cash` c WHERE t.`receipt_id`= r.id AND r.`cash_id` = ".$idCaisse . " AND t.`status`= 1 ";
	 $data = $pdo->query($sql);
	 $data->setFetchMode(PDO::FETCH_ASSOC);	
	 if($row = $data->fetch()){
		$idTicket = $row['id'];
	 }

	 //	Liste des products par catégorie
	 $sql="SELECT `ID`, `REFERENCE`, `BARCODE`, `BARCODE_TYPE`, `NAME`, `PRICE_BUY`, `PRICE_SELL`, `CATEGORY_ID`, `PROVIDER_ID`, `TAXCATEGORY_ID`,
	  `ATTRIBUTESET_ID`, `STOCK_COST`, `STOCK_VOLUME`, `ATTRIBUTES` FROM product WHERE `CATEGORY_ID`='".$idCat."';";
	 $data = $pdo->query($sql);
	 $data->setFetchMode(PDO::FETCH_ASSOC);	

	foreach($data as $row)
	{	
		print "<li><a href='#' onclick='addProduct(".$row['ID'].",".$idTicket.")'>". $row['NAME'] ." </a></li>";
		print "<li><a href='#' onclick='showTicket(\"".htmlspecialchars($row['ID'],ENT_QUOTES)."\")'>". $row['NAME'] ." </a></li>";		
	}

?>
