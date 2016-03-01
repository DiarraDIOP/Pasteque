<?php

require '../config/config.php'; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 
 $data = $pdo->query('SELECT `FIRSTNAME`, `LASTNAME` FROM customers');
 $data->setFetchMode(PDO::FETCH_ASSOC);

   foreach($data as $row) {
        print "<li><a href='#'>". $row['FIRSTNAME'] ."  ". $row['LASTNAME'] ."</a></li>";
   }

?>