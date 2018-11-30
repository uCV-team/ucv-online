let resultsList;

window.initMap = function() {
    $('#map').each((_, mapElement) => {
        console.log('loaded');
        new google.maps.Map(mapElement, {
            center: {lat: 46.8182, lng: 8.2275},
            zoom: 7
        });
    });
};

function setResultsList(formattedSearchResults) {

}

$(document).on('turbolinks:load', () => {
    if ('google' in window) {
        initMap();
    }
});
