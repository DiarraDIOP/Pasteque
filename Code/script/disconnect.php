<?php
	session_start();
	session_destroy();
    header('Location: ../pages/page_connexion.html');
?>