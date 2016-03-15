<?php
       
$user='root';
$pass='';
$serveur='localhost';

$dernierebase='pasteque_new';
try
{
	$pdo = new PDO("mysql:host=$serveur;dbname=$dernierebase;",$user,$pass); 
}
catch(PDOException $e)
{
	die("erreur ! : " .$e->getMessage());
}
?>