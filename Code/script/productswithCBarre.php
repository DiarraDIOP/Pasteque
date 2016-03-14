 <?php


 require '../config/config.php'; 
  
 $idCodeBarre = intval($_GET['idCodeBarre']);

 	 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 	 $sql="SELECT * FROM product WHERE `CODE` LIKE '%".$idCodeBarre."%'";
 	 $data = $pdo->query($sql);
 	 $data->setFetchMode(PDO::FETCH_ASSOC);
 
 	 $products= array();
 
 	 header('Content-type: image/jpeg');
 	 header('Content-transfer-encoding: binary');
 
 	foreach($data as $row)
 	{
 		print "<li>   <a href='#' onclick=''> <img src='data:image/jpeg;base64,".base64_encode($row['IMAGE'])."' width='50'> - ".$row['NAME']." </a></li>";
 	}

  