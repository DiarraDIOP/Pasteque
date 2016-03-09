
function surligne(champ, erreur)
{
   if(erreur)
      champ.style.backgroundColor = "#fba";
   else
      champ.style.backgroundColor = "";
}

function verifLogin(champ)
{
   if(champ.value.length < 2 || champ.value.length > 25)
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

function verifFormLog(f)
{   
   if(verifLogin(f.login))
      return true;
   else
   {
      alert("Veuillez remplir correctement votre Login");
      return false;
   }
}