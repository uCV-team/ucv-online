function initMap() {
    $('#map').each((_, mapElement) => {
        new google.maps.Map(mapElement, {
            center: {lat: 46.8182, lng: 8.2275},
            zoom: 7
        });
    });
}

window.initMap = initMap;
