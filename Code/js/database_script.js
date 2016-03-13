
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
            console.log("id categorie (products): "+id);
        }
    };
    xmlhttp.open("GET","../script/products.php?idCodeBarre=null&id="+id, true);
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
