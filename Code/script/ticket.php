<?php

require '../config/config.php'; 

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$id = $_GET['id'];
	 $sql="SELECT `ID`, `TYPE`, `RECEIPT_ID`, `USER_ID`, `CUSTOMER_ID`, `STATUS`, `CUSTOMER_COUNT`, `TARIFFAREA_ID`, `DISCOUNT_RATE`, 
	 `DISCOUNTPROFILE_ID` FROM ticket WHERE `ID`='".$id."';";
	 $data = $pdo->query($sql);
	 $data->setFetchMode(PDO::FETCH_ASSOC);
	 $ticket= array();

	   foreach($data as $row)
	{
		$ticket = array('ID' => $row['ID'], 'TYPE' => $row['TYPE'], 'RECEIPT_ID' => $row['RECEIPT_ID'], 'USER_ID' => $row['USER_ID'], 'CUSTOMER_ID' => $row['CUSTOMER_ID'], 'STATUS' => $row['STATUS'], 'CUSTOMER_COUNT' => $row['CUSTOMER_COUNT'], 'TARIFFAREA_ID' => $row['TARIFFAREA_ID], 'DISCOUNT_RATE' => $row['DISCOUNT_RATE'], 'DISCOUNTPROFILE_ID' => $row['DISCOUNTPROFILE_ID']);
		
		print "<li><a href='#' onclick=''>". $row['NAME'] ." </a></li>";
	}

?>