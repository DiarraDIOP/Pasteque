<?php

require '../config/config.php'; 

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$id = $_GET['id'];
	 $sql="SELECT `ID`, `TICKETTYPE`, `TICKETID`, `PERSON`, `CUSTOMER`, `STATUS`, `CUSTCOUNT`, `TARIFAREA`, `DISCOUNTRATE`, 
	 `DISCOUNTPROFILE_ID` FROM tickets WHERE `ID`='".$id."';";
	 $data = $pdo->query($sql);
	 $data->setFetchMode(PDO::FETCH_ASSOC);
	 $ticket= array();

	   foreach($data as $row)
	{
		$ticket = array('ID' => $row['ID'], 'TICKETTYPE' => $row['TICKETTYPE'], 'TICKETID' => $row['TICKETID'], 'PERSON' => $row['PERSON'], 'CUSTOMER' => $row['CUSTOMER'], 'STATUS' => $row['STATUS'], 'CUSTCOUNT' => $row['CUSTCOUNT'], 'TARIFAREA' => $row['TARIFAREA'], 'DISCOUNTRATE' => $row['DISCOUNTRATE'], 'DISCOUNTPROFILE_ID' => $row['DISCOUNTPROFILE_ID']);
		
		print "<li><a href='#' onclick=''>". $row['NAME'] ." </a></li>";
	}

?>