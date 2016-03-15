
function showClients() {
    var xmlhttp;
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
    var xmlhttp;
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
    var xmlhttp;
    
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


function showTicket() {
    var xmlhttp;
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
    xmlhttp.open("GET","../script/ticketline.php",true);
    xmlhttp.send();
}

function addProduct(idProduct,idTicket) {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    
    xmlhttp.open("GET","../script/ajoutProduit.php?idTicket="+idTicket+"&idProduct="+idProduct,true);
    xmlhttp.send();
}

function totalTicket(){
    var xmlhttp;
    console.info("totalTicket");
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
       xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            console.info("setting total");
            console.info("actual content" + document.getElementById("total").innerHTML);
            console.info("new content : "+  xmlhttp.responseText);
            document.getElementById("total").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("GET","../script/totalTicket.php",true);
    xmlhttp.send();
}

function disconnect() {
    var xmlhttp;
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

    console.info("paymentMode")
    var xmlhttp;
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
     xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
   xmlhttp.onreadystatechange = function() { 
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            console.info("setting paymentMode");
            console.info("actual content" + document.getElementById("payement").innerHTML);
            console.info("new content : "+  xmlhttp.responseText);
            document.getElementById("payement").innerHTML = xmlhttp.responseText;
        }
        console.info(xmlhttp.readyState);
    };
    xmlhttp.open("GET","../script/paiementMode.php?",true);
    xmlhttp.send();
}

function paiementReturn(id){
    var xmlhttp;
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
    var xmlhttp;
    
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
function updateTicket(idTicketLine,nb) {
    console.log("test");
     if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("quantity_"+idTicketLine).innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("GET","../script/updateTicket.php?nb="+nb+"&idTicketLine="+idTicketLine,true);
    xmlhttp.send();
}