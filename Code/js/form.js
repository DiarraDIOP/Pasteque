
function surligne(champ, erreur)
{
   if(erreur){
      champ.style.backgroundColor = "#fba";
   }
   else
      champ.style.backgroundColor = "";
}

function verifLogin(champ)
{
   if((/^[a-zA-Z0-9]{5,8}$/).test(champ.value))
   {
      surligne(champ, false);
      return true;
   }
   else
   {
      surligne(champ, true);
      return false;
   }
}

function verifFormLog(f)
{   
   if(verifLogin(f.login) && verifSaisie(f.motdepasse))
      return true;
   else
   {
      alert("Veuillez remplir correctement votre Login ou Mot de passe");
      return false;
   }
}


function verifSaisie(champ)
{
   if((champ.value) == "")
   {
      surligne(champ, true);
      return false;
   }
   else
   {
      surligne(champ, false);
      return true;
   }
}

function verifCodeBarre(champ)
{
   if((/^[1-9][0-9]*$/).test(champ.value))
   {
      surligne(champ, false);
      return true;
   }
   else
   {
      surligne(champ, true);
      return false;
   }
}

function verifFormSaisie(f)
{   
   if(verifSaisie(f.libsaisie) && verifSaisie(f.tarif) && verifSaisie(f.tva) && verifCodeBarre(f.codebarre))
      return true;
   else
   {
      alert("Veuillez remplir correctement tous les champs du formulaire de saisie");
      return false;
   }
}

function verifNom(champ)
{
   if (verifSaisie(champ) && (/^[a-zA-Z-\\t]*$/).test(champ.value))
   {  
      surligne(champ, false);
      return true;
   }
   else
   {
      surligne(champ, true);
      return false;
   }
}

function verifCP(champ)
{
   if (verifSaisie(champ) && champ.value.length == 5)
   {  
      surligne(champ, false);
      return true;
   }
   else
   {
      surligne(champ, true);
      return false;
   }
}

function verifTel(champ)
{
   if (verifSaisie(champ) && (/^[0-9]{10}$/).test(champ.value))
   {  
      surligne(champ, false);
      return true;
   }
   else
   {
      surligne(champ, true);
      return false;
   }
}

function verifEmail(champ)
{
   if (verifSaisie(champ) && (/^[0-9a-z._-]+@{1}[0-9a-z.-]{2,}[.]{1}[a-z]{2,5}$/).test(champ.value))
   {  
      surligne(champ, false);
      return true;
   }
   else
   {
      surligne(champ, true);
      return false;
   }
}


function verifFormAjC(f)
{   
   if(verifNom(f.nom) && verifCP(f.cp) && verifTel(f.tel) && verifEmail(f.email))
      return true;
   else
   {
      alert("Veuillez remplir correctement tous les champs du formulaire Client");
      return false;
   }
}