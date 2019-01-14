var map;

var marker;
var latitud = 9.948440;
var longitud = -84.143611;

function placeMarker(location) {
  latitud = location.lat();
  longitud = location.lng();
  document.getElementById("lat").value = latitud;
  document.getElementById("lng").value = longitud;
  if ( marker ) {
    marker.setPosition(location);
  } else {
    marker = new google.maps.Marker({
      position: location,
      map: map
    });
  }
}

function initMap() {
  map = new google.maps.Map(document.getElementById('mapaE'), {
    center: {lat: 9.948440 , lng: -84.143611 },
    zoom: 8
  });


  google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);

});
}

function nuevoEvento(){
  let formData = new FormData();
  let req = new XMLHttpRequest();
  let photo = document.getElementById("image-file").files[0];  // file from input

  formData.append("photo", photo);
  req.open("POST", '/upload/image');
  req.send(formData);
  var name = document.getElementById("fname").value;
  var desc = document.getElementById("fdesc").value;
  var punt = document.getElementById("fpunt").value;
  var tipo = document.getElementById("ftipo").value;
  var fech = document.getElementById("ffecha").value;
  var ubic = document.getElementById("fubi").value;
  var fprov = document.getElementById("fprov").value;
  var parameters = { 'name': name, 'desc': desc, 'punt': punt, 'tipo': tipo, 'fech': fech, 'ubic': ubic, 'fprov': fprov, 'lat':latitud , 'lng': longitud };

}
