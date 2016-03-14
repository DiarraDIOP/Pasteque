<?php

require '../config/config.php'; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 
 $data = $pdo->query('SELECT `DISPLAY_NAME` FROM customer');
 $data->setFetchMode(PDO::FETCH_ASSOC);

   foreach($data as $row) {
        print "<li><a href='#'>". $row['DISPLAY_NAME'] ."</a></li>";
   }

?>