<?php

require '../config/config.php'; 

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$id = $_GET['idticket'];
	$sql="SELECT `TICKET`, `LINE`, `PRODUCT`, `UNITS`, `PRICE`, `TAXID`, `DISCOUNTRATE`, `ATTRIBUTES` 
	FROM ticketlines WHERE `TICKET`='".$id."';";

	$data = $pdo->query($sql);
	$data->setFetchMode(PDO::FETCH_ASSOC);

	foreach($data as $row)
	{
		$sql1="SELECT `ID`, `REFERENCE`, `CODE`, `CODETYPE`, `NAME`, `PRICEBUY`, `PRICESELL`, `CATEGORY`, `PROVIDER`, `TAXCAT`,
	  `ATTRIBUTESET_ID`, `STOCKCOST`, `STOCKVOLUME`, `ATTRIBUTES` FROM products WHERE `ID`='".$row['PRODUCT']."';";;

			$data1 = $pdo->query($sql1);
			$data1->setFetchMode(PDO::FETCH_ASSOC);
			foreach($data1 as $row1)
			{
				print "<li>". $row1['NAME'] ." </li>";
			}
	}

?>