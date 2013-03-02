$(document).ready ->
  defaultMapOptions =
    center: new google.maps.LatLng 40.7142, 74.0064
    zoom: 8
    mapTypeId: google.maps.MapTypeId.ROADMAP

  window.courserv_scripts.locationMap = locationMap = new google.maps.Map document.getElementById("location_gMap"), defaultMapOptions
