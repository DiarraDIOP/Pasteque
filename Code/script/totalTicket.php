<?php

require '../config/config.php'; 

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$id = $_GET['idticket'];
	$sql="SELECT `TICKET_ID`, `LINE`, `PRODUCT_ID`, `QUANTITY`, `PRICE`, `TAX_ID`, `DISCOUNT_RATE`, `ATTRIBUTES` 
	FROM ticket_line WHERE `TICKET_ID`='".$id."';";

	$data = $pdo->query($sql);
	$data->setFetchMode(PDO::FETCH_ASSOC);
	$total = 0;
	$rate=0;
	foreach($data as $row)
	{	
		$tax=$pdo->query("SELECT `RATE` FROM tax WHERE `TAXCATEGORY_ID`=".$row['TAX_ID']);
		$result=0;
		foreach($tax as $t)
		{
			if($t['RATE'] !=0){
				$rate = ($row['PRICE']*$row['QUANTITY'])*$t['RATE'];

			}else{
				$rate=0;
			}
		}
		$result=($row['PRICE']*$row['QUANTITY'])+$rate;
		$total=$total+$result;
	}
	print "<output type='text'>".$total."</output>";
?>