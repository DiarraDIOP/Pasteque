<?php

require '../config/config.php'; 

class Utilisateur {
	private   $_name;
	private   $_password;	
	
	public function prenom() {
		return $this->_prenom;
	}
	
	public function affichage() {
		return "<div>
		name : ".{$this->_name}." <br>
		</div> ";
	}
	
	
	public static function formulaireConnexion($_action){
		$html=<<<HTML
                  <form class="form-horizontal"  method="POST" action="{$_action}" onsubmit="return verifFormLog(this)">
                        
                            <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="inputEmail3" placeholder="User" name="login" onblur="verifLogin(this)">
                            </div>
                            </div>
                            <div class="form-group">
                            <div class="col-sm-12">
                                <input type="password" name="motdepasse" class="form-control" id="inputPassword3" placeholder="Password" onblur="verifSaisie(this)">

                            </div>
                            </div>                             
                            <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                            </div>
                            </div>
                            <div class="col-sm-12">
                            <button id="btn" type ="submit" class="btn btn-danger">Se connecter</button>
                            </div>
                            </div>
                            <div class="form-group">
                            <div class="col-sm-12">
                               
                            </div>

                            </div>
                        </form> 
HTML;
		return $html;
	}
	
	
	public function connexion($_name, $_pass){
	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 
	$data = $pdo->query("SELECT * FROM people where NAME = ".$_login." AND APPPASSWORD = ".$_pass);
 	$data->setFetchMode(PDO::FETCH_ASSOC);

		if($row = $data->fetch()){
			$this->_name=$ligne['NAME'];
		 	$this->_password=$ligne['APPPASSWORD'];
		 	return true;
		}
		else{
			throw new ConnexionException(" Echec de connexion ") ;
		}        
	}
}


/**********exception************/

class ConnexionException extends Exception { 
	//parent:: __construct()
}

?>