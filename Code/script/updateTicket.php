 <?php

require '../config/config.php'; 

	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$idticket = $_GET['idTicketLine'];
	$nb = $_GET['nb'];

	$sql="UPDATE `pasteque`.`ticket_line` SET `quantity` = '".$nb."' WHERE `ticket_line`.`id` ='"+$idticket+"';";
	$pdo->query($sql);

	 header('Location: ../pages/caisse.html');
?>
