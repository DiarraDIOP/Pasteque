$(document).ready(function(){ 
  $.get("include/header.html", function(data) {
    $("#header").html(data);
  });
}); 

$(document).ready(function(){ 
  $.get("include/nav.html", function(data) {
    $("#nav").html(data);
  });
}); 