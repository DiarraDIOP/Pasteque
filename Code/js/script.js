$(document).ready(function(){ 
  $.get("include/header.html", function(data) {
    $("#header").html(data);
  });
}); 

$(document).ready(function(){ 
  $.get("include/catalogue.html", function(data) {
    $("#catalogue").html(data);
  });
}); 