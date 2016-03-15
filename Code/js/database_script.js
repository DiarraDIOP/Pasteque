
function showClients() {
    
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("clients").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("GET","../script/clients.php",true);
    xmlhttp.send();
}

function showProducts(id) {
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("product_"+id).innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("GET","../script/products.php?id="+id, true);
    xmlhttp.send();
}


function showCategories() {
    
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("categories").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("GET","../script/categories.php",true);
    xmlhttp.send();
}


function showTicket(idTicket) {
    
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
   xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("ticketProduits").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("GET","../script/ticketline.php?idticket="+idTicket,true);
    xmlhttp.send();
}

function addProduct(idTicket,idProduct) {
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    
    xmlhttp.open("GET","../script/ajoutProduit.php?idticket="+idTicket+"&idProduct="+idProduct,true);
    xmlhttp.send();
}

function totalTicket(idTicket){
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
       xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("total").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("GET","../script/totalTicket.php?idticket="+idTicket,true);
    xmlhttp.send();
}

function disconnect() {

    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET","../script/disconnect.php",true);
    xmlhttp.send();
}

function paymentMode(){
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
   xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("payement").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("GET","../script/paiementMode.php?",true);
    xmlhttp.send();
}

function paiementReturn(id){
if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

 xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("backname").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("GET","../script/paiementReturn.php?id="+id,true);
    xmlhttp.send();

}

function tva_categorie() {
    
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("tva").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("GET","../script/taxcategories.php",true);
    xmlhttp.send();
}
function update(idTicketLine) {
    
    
}