let map, nav, center;
let markers = [];

//Define the map and configure the map's theme
window.initMap = function() {
  center = mapCenterCoordinates()
  center = center.split('&').map((e) => parseFloat(e))
  console.log(center)

  $('#map').each((_, mapElement) => {
    map = new mapboxgl.Map({
        container: mapElement,
        attributionControl: false, //need this to show a compact attribution icon (i) instead of the whole text
        style: unwired.getLayer("streets"), //get Unwired's style template
        zoom: 11,
        center: center
    });

    //Add Navigation controls to the map to the top-right corner of the map
    nav = new mapboxgl.NavigationControl();
    map.addControl(nav, 'top-left');
  });

  // Load search results from home page if any
  loadMarkersFromPage()
};

window.generateMarkers = function(searchResultsList) {
    clearMarkers();
    searchResultsList.forEach(entry => {
      let coordinates = Object.values(entry.location); // coordinates
      let el = document.createElement('div'); // creating marker
      el.className = 'marker';

      let popup = new mapboxgl.Popup()
        .setHTML('<b>'+entry.name+'</b>'); // Popup with user name

      markers.push(
        new mapboxgl.Marker(el)
            .setLngLat(coordinates)
            .setPopup(popup)
            .addTo(map)
      );
    });

    centerMap();
};

function centerMap() {
    if (markers.length > 0) {
        const bounds = new mapboxgl.LngLatBounds();
        markers.forEach(marker => {
            bounds.extend(marker.getLngLat());
        });
        map.fitBounds(bounds);
    }
}

function clearMarkers() {
    markers.forEach(marker => {
       marker.remove();
    });
    markers = [];
}

//Add your Unwired Maps Access Token here (not the API token!)
function setUnwiredApiToken(token) {
  unwired.key = mapboxgl.accessToken = token;
}

function loadMarkersFromPage(){
  if (window.searchResultsList.length > 0) generateMarkers(window.searchResultsList)
}

function getCookie(name) {
    var cookieArr = document.cookie.split(";");
    for(var i = 0; i < cookieArr.length; i++) {
        var cookiePair = cookieArr[i].split("=");
        if(name == cookiePair[0].trim()) {
            return decodeURIComponent(cookiePair[1]);
        }
    }
    return null;
}

function mapCenterCoordinates(){
  let loc = getCookie('geo_loc');
  if (loc == null) loc = "78.4008997&17.4206485"
  return loc;
}

$(document).on('turbolinks:load', () => {
    if ('mapboxgl' in window) {
        initMap();
    }
});

window.setUnwiredApiToken = setUnwiredApiToken;
