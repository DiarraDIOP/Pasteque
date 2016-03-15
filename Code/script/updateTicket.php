 <?php

require '../config/config.php'; 

	$nb = $_GET['nb'];
	$idticket = $_GET['idTicketLine'];
	
	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$data=$pdo->prepare("UPDATE `pasteque`.`ticket_line` SET `quantity` = '".$nb."' WHERE `ticket_line`.`id` ='"+$idticket+"';");
	$exe=$data->execute();
	 header('Location: ' . $_SERVER['HTTP_REFERER'] );
?>
