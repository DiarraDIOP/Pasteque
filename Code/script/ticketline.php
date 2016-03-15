<?php

require '../config/config.php'; 

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$id = $_GET['idticket'];
	$sql="SELECT `ID`,`TICKET_ID`, `LINE`, `PRODUCT_ID`, `QUANTITY`, `PRICE`, `TAX_ID`, `DISCOUNT_RATE`, `ATTRIBUTES` 
	FROM ticket_line WHERE `TICKET_ID`='".$id."';";

	$data = $pdo->query($sql);
	$data->setFetchMode(PDO::FETCH_ASSOC);


	foreach($data as $row)
	{   
		$sql1="SELECT `ID`, `REFERENCE`, `BARCODE`, `BARCODE_TYPE`, `NAME`, `PRICE_BUY`, `PRICE_SELL`, `CATEGORY_ID`, `PROVIDER_ID`, `TAXCATEGORY_ID`,
	  `ATTRIBUTESET_ID`, `STOCK_COST`, `STOCK_VOLUME`, `ATTRIBUTES`, `IMAGE` FROM product WHERE `ID`='".$row['PRODUCT_ID']."';";;

			$data1 = $pdo->query($sql1);
			$data1->setFetchMode(PDO::FETCH_ASSOC);
			foreach($data1 as $row1)
			{
				print "<tr><td><img src='data:image/jpeg;base64,".base64_encode($row1['IMAGE'])."' width='50'>". $row1['NAME'] ."</td><td> <input type='number' id='quantity_".$row['ID']."' value='".$row['QUANTITY']."' onchange='updateTicket(\"".$row['ID']."\",this.value)' style='float:left;' step='1' min='0' width='5px'/></td></tr>";
			}
	}

echo " <script>totalTicket('".$id."');</script>";

?>
