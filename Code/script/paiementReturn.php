<?php

require '../config/config.php'; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$id = $_GET['id'];
	$sql='SELECT `ID`, `CODE`, `NAME`, `BACK_NAME`, `FLAGS`,`ACTIVE`, `SYSTEM`, `DISPLAY_ORDER` FROM payment_mode WHERE `ID`="'
 	.$id.'";';
 $data = $pdo->query($sql);
 $data->setFetchMode(PDO::FETCH_ASSOC);

/* $categories= array();*/

   foreach($data as $row)
{
	$name= addslashes($row['BACK_NAME']);
    print "<p>
                    <label style='font-size:14px'>".htmlspecialchars($name,ENT_QUOTES)." : </label>
                    <output type='text' id='prepaid' placeholder='00' height='10px' width='20px'/>
                </p> ";

}


?>