<?php

require '../config/config.php'; 
	
	session_start();


	 $idCat = $_GET['id'];
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



	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	 $id = $_GET['id'];
	 
	 $sql="SELECT `ID`, `TYPE`, `RECEIPT_ID`, `USER_ID`, `CUSTOMER_ID`, `STATUS`, `CUSTOMER_COUNT`, `TARIFFAREA_ID`, `DISCOUNT_RATE`, 
	 `DISCOUNTPROFILE_ID` FROM ticket WHERE `ID`='".$idTicket."';";
	 $data = $pdo->query($sql);
	 $data->setFetchMode(PDO::FETCH_ASSOC);
	 $ticket= array();

	   foreach($data as $row)
	{
		$ticket = array('ID' => $row['ID'], 'TYPE' => $row['TYPE'], 'RECEIPT_ID' => $row['RECEIPT_ID'], 
			'USER_ID' => $row['USER_ID'], 'CUSTOMER_ID' => $row['CUSTOMER_ID'], 'STATUS' => $row['STATUS'], 
			'CUSTOMER_COUNT' => $row['CUSTOMER_COUNT'], 'TARIFFAREA_ID' => $row['TARIFFAREA_ID'], 
			'DISCOUNT_RATE' => $row['DISCOUNT_RATE'], 'DISCOUNTPROFILE_ID' => $row['DISCOUNTPROFILE_ID']);
		
		print "<li><a href='#' onclick=''>". $row['NAME'] ." </a></li>";
	}

?>