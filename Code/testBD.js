

var jArray = <?php echo json_encode($res); ?>;

function showme(j) {
    for(var i=0; i < j.length; i++){ 
    	document.write(j[i]); 
    }
};
showme(jArray);