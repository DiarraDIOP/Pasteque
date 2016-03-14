<?php

require '../config/config.php'; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


 $data = $pdo->query('SELECT `ID`, `CODE`, `NAME`, `BACK_NAME`, `FLAGS`,`ACTIVE`, `SYSTEM`, `DISPLAY_ORDER` FROM payment_modes');
 $data->setFetchMode(PDO::FETCH_ASSOC);

/* $categories= array();*/

   foreach($data as $row)
{
	$id= addslashes($row['ID']);
	$name= addslashes($row['NAME']);
    print "<li><figure>
                <a onclick='paiementReturn(\"".htmlspecialchars($id,ENT_QUOTES)."\")'>
                <figcaption style='font-size:14px'>".$name."</figcaption></a>
           </figure></li>";

}


?>