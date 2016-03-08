<?php

require '../config/config.php'; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

 $sql="SELECT `ID`, `REFERENCE`, `NAME`, `PARENTID`, `IMAGE`, `DISPORDER` FROM categories";

 $data = $pdo->query($sql);
 $data->setFetchMode(PDO::FETCH_ASSOC);

/* $categories= array();*/

   foreach($data as $row)
{
	/*$category = array('ID' => $row['ID'], 'REFERENCE' => $row['REFERENCE'], 'NAME' => $row['NAME'], 'PARENTID' => $row['PARENTID'], 'IMAGE' => $row['IMAGE'], 'DISPORDER' => $row['DISPORDER']);
	*/print "<li><a href='#'>". $row['NAME'] ." </a></li>";
}



?>