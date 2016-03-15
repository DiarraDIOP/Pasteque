<?php

require '../config/config.php'; 

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$idTicket = 0;

	 //recup de la dernière caisse ouverte liée au user connecté
	 $sql="SELECT distinct id FROM `cash` WHERE `open_cash`= 1 ";
	 $data = $pdo->query($sql);
	 $data->setFetchMode(PDO::FETCH_ASSOC);	
	 if($row = $data->fetch()){
		$idCaisse = $row['id'];
	 }
	
	 //recup du ticket ouvert dans la caisse
	 $sql="SELECT distinct t.`id` FROM `ticket`t,`receipt`r, `cash` c WHERE t.`receipt_id`= r.`id` AND r.`cash_id` = ".$idCaisse . " AND t.`status`= 1 ";
	 $data = $pdo->query($sql);
	 $data->setFetchMode(PDO::FETCH_ASSOC);	
	 if($row = $data->fetch()){
		$idTicket = $row['id'];
	 }
	$sql="SELECT `TICKET_ID`, `LINE`, `PRODUCT_ID`, `QUANTITY`, `PRICE`, `TAX_ID`, `DISCOUNT_RATE`, `ATTRIBUTES` 
	FROM ticket_line WHERE `TICKET_ID`='".$idTicket."';";

	$data = $pdo->query($sql);
	$data->setFetchMode(PDO::FETCH_ASSOC);
	$total = 0;
	$rate=0;
	foreach($data as $row)
	{	
		$tax=$pdo->query("SELECT `RATE` FROM tax WHERE `TAXCATEGORY_ID`='".$row['TAX_ID']."';");
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
	print "<label type='text'>TOTAL : ".$total."</label>";