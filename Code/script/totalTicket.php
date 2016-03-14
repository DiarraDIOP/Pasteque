<?php

require '../config/config.php'; 

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$id = $_GET['idticket'];
	$sql="SELECT `TICKET`, `LINE`, `PRODUCT`, `UNITS`, `PRICE`, `TAXID`, `DISCOUNTRATE`, `ATTRIBUTES` 
	FROM ticketlines WHERE `TICKET`='".$id."';";

	$data = $pdo->query($sql);
	$data->setFetchMode(PDO::FETCH_ASSOC);
	$total = 0;
	$rate=0;
	foreach($data as $row)
	{	
		$tax=$pdo->query("SELECT `RATE` FROM taxes WHERE `CATEGORY`=".$row['TAXID']);
		$result=0;
		foreach($tax as $t)
		{
			if($t['RATE'] !=0){
				$rate = ($row['PRICE']*$row['UNITS'])*$t['RATE'];

			}else{
				$rate=0;
			}
		}
		$result=($row['PRICE']*$row['UNITS'])+$rate;
		$total=$total+$result;
	}
	print "<output type='text'>".$total."</output>";
?>