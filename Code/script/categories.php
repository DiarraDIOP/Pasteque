<?php

require '../config/config.php'; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


 $data = $pdo->query('SELECT `ID`, `REFERENCE`, `NAME`, `PARENT_ID`, `IMAGE`, `DISPLAY_ORDER` FROM category');
 $data->setFetchMode(PDO::FETCH_ASSOC);


   foreach($data as $row)
{
	$id= addslashes($row['ID']);
	$name= addslashes($row['NAME']);
	
    print "<li><a onclick='showProducts(\"".htmlspecialchars($id,ENT_QUOTES)."\")'><img src='data:image/jpeg;base64,".base64_encode($row['IMAGE'])."' width='50'>".$name ."</a></li><ul id='product_".$id."'></ul>";

}

?>