<?php
       

/*$pdo = new PDO('mysql:host=localhost;dbname=bddtest', 'root', '');     */  
$user='root';
$pass='';
$serveur='localhost';

$dernierebase='bddtest';
try
{
	$dbh=new PDO("mysql:host=$serveur;dbname=$dernierebase;",$user,$pass);

}
catch(PDOException $e)
{
	die("erreur ! : " .$e->getMessage());
}
?>