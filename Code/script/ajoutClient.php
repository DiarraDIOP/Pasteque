<?php

require '../config/config.php'; 

$characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
$string = "";
 for ($i = 0; $i < 32; $i++) {
      $string .= $characters[rand(0, strlen($characters) - 1)];
 }

 $id = $string;
 $nom = $_POST['nom'];
 $cp = $_POST['cp'];
 $email = $_POST['email'];
 $tel = $_POST['tel']; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

 $data = $pdo->query("INSERT INTO ".$dernierebase.".customers (`ID`, `SEARCHKEY`, `TAXID`, `NAME`, `TAXCATEGORY`, `DISCOUNTPROFILE_ID`, `CARD`, `MAXDEBT`, `ADDRESS`, `ADDRESS2`, `POSTAL`, `CITY`, `REGION`, `COUNTRY`, `FIRSTNAME`, `LASTNAME`, `EMAIL`, `PHONE`, `PHONE2`, `FAX`, `NOTES`, `VISIBLE`, `CURDATE`, `CURDEBT`, `PREPAID`, `TARIFFAREA_ID`, `EXPIREDATE`) VALUES ('".$id."', NULL, NULL, '".$nom. "', NULL, NULL, NULL, '0', NULL, NULL, '".$cp."', NULL, NULL, NULL, NULL, NULL, '".$email."', '".$tel."', NULL, NULL, NULL, b'1', NULL, NULL, '0', NULL, NULL)");

header('Location: ' . $_SERVER['HTTP_REFERER'] );
?>
