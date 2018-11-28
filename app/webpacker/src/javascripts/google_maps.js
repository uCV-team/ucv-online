function initMap() {
    $('#map').each((_, mapElement) => {
        new google.maps.Map(mapElement, {
            center: {lat: -34.397, lng: 150.644},
            zoom: 8
        });
    });
}

window.initMap = initMap;
