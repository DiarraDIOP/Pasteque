<?php

require '../config/config.php'; 

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	 $idCaisse = 0;
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
	$sql="SELECT `ID`,`TICKET_ID`, `LINE`, `PRODUCT_ID`, `QUANTITY`, `PRICE`, `TAX_ID`, `DISCOUNT_RATE`, `ATTRIBUTES` 
	FROM ticket_line WHERE `TICKET_ID`='".$idTicket."';";

	$data = $pdo->query($sql);
	$data->setFetchMode(PDO::FETCH_ASSOC);


	foreach($data as $row)
	{   
		$sql1="SELECT * FROM product WHERE `ID`='".$row['PRODUCT_ID']."';";;

			$data1 = $pdo->query($sql1);
			$data1->setFetchMode(PDO::FETCH_ASSOC);
			foreach($data1 as $row1)
			{
				print "<tr><td><img src='data:image/jpeg;base64,".base64_encode($row1['image'])."' width='50'>". $row1['name'] ."</td><td> <input type='number' id='quantity_".$row['ID']."' value='".$row['QUANTITY']."' onchange='updateTicket(".$row['ID'].",this.value)' style='float:left;' step='1' min='0' width='5px'/></td></tr>";
			}
	}


?>
