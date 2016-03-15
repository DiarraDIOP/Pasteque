<?php 

class Utilisateur {
	private   $_name;
	private   $_password;	
	private   $_id;	
	
	public function affichage() {
		return "<div>
		name : ".$this->_name." <br>
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
	
	
	public function connexion($_name, $_pass, $pdo){
	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 
	$data = $pdo->query("SELECT * FROM fos_user where username = '".$_name."' AND password = '".$_pass."'");
 	$data->setFetchMode(PDO::FETCH_ASSOC);

		if($row = $data->fetch()){
			$this->_name = $row['username'];
		 	$this->_password = $row['password'];
		 	$this->_id = $row['id'];
		 	return true;
		}
		else{
			echo " Echec de connexion " ;
		}        
	}

	public function id() {
		return $this->_id;
	}
}


?>