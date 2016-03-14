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

$(document).ready(function(){ 
  $.get("ticket.html", function(data) {
    $("#ticket").html(data);
  });
});

$(document).ready(function(){ 
  $.get("include/calculatrice.html", function(data) {
    $("#calculatrice").html(data);
  });
});
