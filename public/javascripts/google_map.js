var my_map;
function initialize(newLat, newLong) {
  var latlng = new google.maps.LatLng(newLat, newLong);
  var myOptions = {
    zoom: 15,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    mapTypeControl: false,
    streetViewControl: false

  };
  my_map = new google.maps.Map(document.getElementById("google_map"),myOptions);
  var markerOptions = {
    map: my_map,
    position: latlng
  };
  new google.maps.Marker(markerOptions);
}

function moveMap(newLat, newLong)
{
  my_map.panTo(newLat, newLong);
}
