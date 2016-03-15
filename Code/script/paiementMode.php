<?php

require '../config/config.php'; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


 $data = $pdo->query('SELECT *  FROM payment_mode');
 $data->setFetchMode(PDO::FETCH_ASSOC);

/* $categories= array();*/

   foreach($data as $row)
{
	$id= addslashes($row['id']);
	$name= addslashes($row['name']);
    print "<li><figure>
                <a onclick='paiementReturn(\"".htmlspecialchars($id,ENT_QUOTES)."\")'>
                <figcaption style='font-size:14px'> <img src='data:image/jpeg;base64,".base64_encode($row['image'])."' width='25'>".$name."   </figcaption></a>
           </figure></li>";

}


?>