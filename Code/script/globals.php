<?php

require '../config/config.php'; 

session_start();
	
	if ($_SESSION['id'] != NULL){
		//recup de l'id de la caisse dont un ticket est relié à la personne connectée à condition que cette caisse soit ouverte
		 $sql="SELECT distinct c.`id` FROM `ticket` t,`receipt`r, `cash` c WHERE c.`id` = r.`cash_id` AND r.`id` = t.`receipt_id` AND c.`open_cash`= '1' AND t.`user_id`=".$_SESSION['id'];
		 $data = $pdo->query($sql);
		 $data->setFetchMode(PDO::FETCH_ASSOC);	
		 if($row = $data->fetch()){
			$idCaisse = $row['id'];
		 }
		$_SESSION['id_caisse'] = $idCaisse;
		print "ID la personne connectee: ".$_SESSION['id'];
		print "id caisse: ".$_SESSION['id_caisse'];
	}
?>