var map;
var markers = [];


//Define the map and configure the map's theme
window.initMap = function() {
  $('#map').each((_, mapElement) => {
    map = new mapboxgl.Map({
        container: mapElement,
        attributionControl: false, //need this to show a compact attribution icon (i) instead of the whole text
        style: unwired.getLayer("streets"), //get Unwired's style template
        zoom: 11,
        center: [78.4008997, 17.4206485]
    });
  });
};

window.generateMarkers = function(searchResultsList) {
    searchResultsList.forEach(entry => {
        var el = document.createElement('div');
        el.id = 'markerWithExternalCss';
        markers.push(
          new mapboxgl.Marker(el)
              .setLngLat(entry.location)
              .addTo(map)
        );
    });
};

//Add your Unwired Maps Access Token here (not the API token!)
function setUnwiredApiToken(token) {
  unwired.key = mapboxgl.accessToken = token;
}

$(document).on('turbolinks:load', () => {
    if ('mapboxgl' in window) {
        initMap();
    }
});


window.setUnwiredApiToken = setUnwiredApiToken;
