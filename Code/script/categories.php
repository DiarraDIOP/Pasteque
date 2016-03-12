<?php

require '../config/config.php'; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


 $data = $pdo->query('SELECT `ID`, `REFERENCE`, `NAME`, `PARENTID`, `IMAGE`, `DISPORDER` FROM categories');
 $data->setFetchMode(PDO::FETCH_ASSOC);

/* $categories= array();*/

   foreach($data as $row)
{
	$id= addslashes($row['ID']);
	$name= addslashes($row['NAME']);
	echo "id des categories: ".$id;
    print "<li><a onclick='showProducts(".$id.")'>". $name ."</a></li><ul id='product_".$id."'></ul>";


}


?>