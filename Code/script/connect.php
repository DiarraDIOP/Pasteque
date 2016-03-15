<?php
require_once "user.class.php";
require_once '../config/config.php';


    if(isset ($_POST['login']) && isset ($_POST['motdepasse'])){

        $login = $_POST['login'];
        $pass = $_POST['motdepasse'];
        $user = new Utilisateur();

        if($user->connexion($login, sha1($pass), $pdo)){
            session_start();
            $_SESSION['name'] = '$login';
            $_SESSION['id'] = $user->id();
            header('Location: ../pages/index.html');
        }
        else{
            header('Location: ../pages/page_connexion.html');
        }

            
    }
    
