<?php

require '../config/config.php'; 

 $data = $pdo->query('SELECT `FIRSTNAME`, `LASTNAME` FROM customers');
   foreach($data as $row) {
     $res[] = json_encode($row);
   }

?>