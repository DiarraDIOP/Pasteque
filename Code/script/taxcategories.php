<?php

require '../config/config.php'; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


 $data = $pdo->query("SELECT * FROM `tax`");
 $data->setFetchMode(PDO::FETCH_ASSOC);


   foreach($data as $row)
{
    print "<option>".$row[rate]."</option>";
}

?>