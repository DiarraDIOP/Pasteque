<?php

require '../config/config.php'; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


 $data = $pdo->query('SELECT `ID`, `REFERENCE`, `NAME`, `PARENTID`, `IMAGE`, `DISPORDER` FROM categories');
 $data->setFetchMode(PDO::FETCH_ASSOC);

/* $categories= array();*/

   foreach($data as $row)
{
	$id= addslashes($row['ID']);
	print "id dans categories.php : ".$id;
	$name= addslashes($row['NAME']);
    print "<form><li><a onclick='showProducts(\"".htmlspecialchars($id,ENT_QUOTES)."\")'>". $name ."</a></li><ul id='product_".$id."'></ul></form>";

}


?>