const mapEle = document.getElementById('googleMap');

function initialize() {
    var location = { lat: 35.658746, lng: 139.745465 }//東京タワー
    // 地図初期化
    var map = new google.maps.Map(mapEle, {
        zoom: 8,
        center: location
    });
};
//create map
var map = new google.maps.Map(document.getElementById("googleMap"))
//create 
var directionsService = new google.maps.DirectionsService();

var directionsDisplay = new google.maps.DirectionsRender();

directionsDisplay.setMap(map);
function calcRoute(){
var request ={
origin:document.getElementById("form").value
}
directionsService.route(request,(result,status)=>{
if(status == google.maps.DirectionsStatus.OK){
 const output = document.querySelector("#output");
 output.innerHTML = "<div class='alert-info'>From:"+ document.getElementById("from").value
}
})
}

//<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBBI4wIgWynv4jemfw_FpI4tNFpQbb74tU&callback=initialize"></script>