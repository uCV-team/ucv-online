let map, nav, center;

//Define the map and configure the map's theme
window.initSearchMap = function() {
  center = mapCenterCoordinates()
  console.log(center)

  $('#search-map').each((_, mapElement) => {
    map = new mapboxgl.Map({
        container: mapElement,
        attributionControl: false, //need this to show a compact attribution icon (i) instead of the whole text
        style: 'https://tiles.locationiq.com/v3/streets/vector.json?key='+unwired.key, //get Unwired's style template
        zoom: 5,
        center: center
    });

    //Add Navigation controls to the map to the top-right corner of the map
    nav = new mapboxgl.NavigationControl({
      showZoom: false //removed map buttons
    });
    map.addControl(nav, 'top-left');
  });

  map.on('load', function (e) {
    map.addSource('map_cv_markers', {
      type: 'geojson',
      data: window.searchResultsList,
      cluster: true,
      clusterRadius: 50
    });

    map.addLayer({
      id: 'clusters',
      type: 'circle',
      source: 'map_cv_markers',
      filter: ['has', 'point_count'],
      paint: {
        'circle-color': [
          'step',
          ['get', 'point_count'],
          '#51bbd6',
          10,
          '#ffff33',
          20,
          '#ff0000'
        ],
        'circle-radius': [
          'step',
          ['get', 'point_count'],
          15,
          10,
          21,
          30,
          28
        ]
      }
    });

    map.addLayer({
      id: 'cluster-count',
      type: 'symbol',
      source: 'map_cv_markers',
      filter: ['has', 'point_count'],
      layout: {
        'text-field': '{point_count_abbreviated}',
        'text-font': ['Arial Unicode MS Bold'],
        'text-size': 12,
        'text-allow-overlap' : true,
      }
    });

    map.addLayer({
      id: 'unclustered-point',
      type: 'circle',
      source: 'map_cv_markers',
      filter: ['!', ['has', 'point_count']],
      paint: {
        'circle-color': '#fff',
        'circle-radius': 4,
        'circle-stroke-width': 5,
        'circle-stroke-color': '#91076C'
      }
    });

    // inspect a cluster on click
    map.on('click', 'clusters', function (e) {
      var features = map.queryRenderedFeatures(e.point, {
        layers: ['clusters']
      });
      var clusterId = features[0].properties.cluster_id;
      map.getSource('map_cv_markers').getClusterExpansionZoom(
        clusterId,
        function (err, zoom) {
          if (err) return;
          map.easeTo({
            center: features[0].geometry.coordinates,
            zoom: zoom
          });
        }
      );
    });

    map.on('click', 'unclustered-point', function (e) {
      var coordinates = e.features[0].geometry.coordinates.slice();
      while (Math.abs(e.lngLat.lng - coordinates[0]) > 180) {
        coordinates[0] += e.lngLat.lng > coordinates[0] ? 360 : -360;
      }

      new mapboxgl.Popup()
          .setHTML(
            '<a href="/cv/'+e.features[0].properties.subdomain+'">'+e.features[0].properties.name+'</a>'
          )
          .setLngLat(coordinates)
          .addTo(map)
    });

    map.on('mouseenter', 'clusters', function () {
      map.getCanvas().style.cursor = 'pointer';
    });

    map.on('mouseleave', 'clusters', function () {
      map.getCanvas().style.cursor = '';
    });

    map.on('mouseenter', 'unclustered-point', function () {
      map.getCanvas().style.cursor = 'pointer';
    });

    map.on('mouseleave', 'unclustered-point', function () {
      map.getCanvas().style.cursor = '';
    });
  });

  // used for disabling scrolling on homepage so that map works using buttons.
  // if (isHomePage()) map.scrollZoom.disable();

  multiTouchSupport() // disable drapPan for mobile on single touch
};

function multiTouchSupport() {
  if ($(window).width() < 767) {

    map.dragPan.enable(); //used to enable dragging map on mobile.
    map.scrollZoom.disable();
  }
}

function mapCenterCoordinates() {
  return window.currentLatLng || [78.4008997, 17.4206485]
}

$(document).on('turbolinks:load', () => {
    if ('mapboxgl' in window) {
        initSearchMap();
    }
});
