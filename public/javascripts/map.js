google.load("maps", "3", {
    other_params:"sensor=false"
});
google.load("earth", "1");
google.setOnLoadCallback(initMaps);

function initMaps() {
    google.earth.createInstance('earth_display', initCB, failureCB);
    
    var latlng = new google.maps.LatLng(-12.5, -77.3);
    var myOptions = {
        zoom: 8,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    selector_map = new google.maps.Map(document.getElementById('selector_map'), myOptions);
}

function initCB(instance) {
    display_earth = instance;
    display_earth.getWindow().setVisibility(true);
   
    display_earth.getNavigationControl().setVisibility(display_earth.VISIBILITY_AUTO);

    // add some layers
    display_earth.getLayerRoot().enableLayerById(display_earth.LAYER_BORDERS, true);
    display_earth.getLayerRoot().enableLayerById(display_earth.LAYER_ROADS, true);

    addObservers();
    fetchKML();
}

function failureCB(errorCode) {
}

function addObservers() {
    google.maps.event.addListener(selector_map, 'bounds_changed', function(event) {
        // Get the current view
        var lookAt = display_earth.getView().copyAsLookAt(display_earth.ALTITUDE_RELATIVE_TO_GROUND);

        // Set new latitude and longitude values
        lookAt.setLatitude(selector_map.getCenter().lat());
        lookAt.setLongitude(selector_map.getCenter().lng());

        // Update the view in Google Earth
        display_earth.getView().setAbstractView(lookAt);
    });
}

function fetchKML() {
    // fetch a KML file and show it
    var link = display_earth.createLink('');
    link.setHref('http://sketchup.google.com/3dwarehouse/download?mid=28b27372e2016cca82bddec656c63017&rtyp=k2');

    var networkLink = display_earth.createNetworkLink('');
    networkLink.setLink(link);
    networkLink.setFlyToView(true);

    display_earth.getFeatures().appendChild(networkLink);
}