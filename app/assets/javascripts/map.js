$(function() {
  var courtsRequest;
  var map;

  var createMap = function(latitude, longitude){
    L.mapbox.accessToken = window.MAPBOX_ACCESS_TOKEN;
    map = L.mapbox.map("map", window.MAPBOX_USER_NAME, { zoomControl: false }).
      setView([latitude, longitude], 14);
  };

  var createMarker = function(court) {
    var marker = L.marker([ court.latitude, court.longitude], {
      icon: L.mapbox.marker.icon({
        'marker-color': '#9c89cc',
      })
    })
    .addTo(map);
    marker.on("click", function(){
      $(".information-box").html(
          "<div>"+court.name+"</div>" +
          "<div>"+court.address+"</div>" +
          "<div>Average Elo: "+court.average_elo+"</div>"+
          "<a href=/courts/"+court.id+">Go to Court</a>"
          )
        .show();
    });
  };

  var plotCourts = function(courts){
    $.each(courts, function(_, court) {
      createMarker(court);
    });
  };

  var hideInformationBox = function(){ $(".information-box").hide(); };

  var isOnCourtsIndex = $("body").hasClass("courts-index");

  var isOnCourtsPage =  $("body").hasClass("courts-show");

  if(isOnCourtsIndex) {
    var mapCenter = $(".full-page-map").data("map-center");
    createMap(mapCenter.latitude, mapCenter.longitude);

    courtsRequest = $.ajax({
      url: "/api/courts",
    });
    courtsRequest.done(plotCourts);
    map.on("click", hideInformationBox);
  }

  if(isOnCourtsPage) {
    courtsRequest = $.ajax({
      url: "/api/courts/" + $(".court-show-container").data("court-id"),
    });

    courtsRequest.done(function(court){
      createMap(court.latitude, court.longitude);
      createMarker(court);
    });
  }
});
