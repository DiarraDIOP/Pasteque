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
 $note = $_POST['note']; 

 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

 $data = $pdo->query("INSERT INTO ".$dernierebase.".customer (`ID`, `SEARCH_KEY`, `NUMBER`, `DISPLAY_NAME`, `TAXCUSTOMERCATEGORY_ID`, `DISCOUNTPROFILE_ID`, `CARD`, `MAX_DEBT`, `ADDRESS`, `ADDRESS2`, `POSTAL`, `DISPLAY_ID`, `REGION`, `COUNTRY`, `FIRSTNAME`, `LASTNAME`, `EMAIL`, `PHONE`, `PHONE2`, `FAX`, `NOTE`, `VISIBLE`, `DEBT_DATE`, `CURRENT_DEBT`, `PREPAID`, `TARIFFAREA_ID`, `EXPIRE_DATE`) VALUES (NULL, NULL, NULL, '".$nom. "', NULL, NULL, NULL, '0', NULL, NULL, '".$cp."', NULL, NULL, NULL, NULL, NULL, '".$email."', '".$tel."', '', NULL, ".$note.", b'1', NULL, NULL, '0', NULL, NULL)");

header('Location: ' . $_SERVER['HTTP_REFERER'] );
?>

