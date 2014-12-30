$(function() {
  L.mapbox.accessToken = "pk.eyJ1IjoiZWxpa2ltIiwiYSI6Ik1YSm9TY3cifQ.-aONewTGq_GmSuvGS7xQaQ"
  var map = L.mapbox.map('map', 'elikim.kkgb4e2p').setView([40.738, -73.990], 13);

  function addMarkers() {
    var data = $('#map').data('markers');

  }

  addMarkers();
});
