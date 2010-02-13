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
    var map = new google.maps.Map(document.getElementById('selector_map'), myOptions); 
}

function initCB(instance) {
    ge = instance;
    ge.getWindow().setVisibility(true);
   
    ge.getNavigationControl().setVisibility(ge.VISIBILITY_AUTO);

    // add some layers
    ge.getLayerRoot().enableLayerById(ge.LAYER_BORDERS, true);
    ge.getLayerRoot().enableLayerById(ge.LAYER_ROADS, true);

    // fetch a KML file and show it
    var link = ge.createLink('');
    link.setHref('http://sketchup.google.com/3dwarehouse/download?mid=28b27372e2016cca82bddec656c63017&rtyp=k2');

    var networkLink = ge.createNetworkLink('');
    networkLink.setLink(link);
    networkLink.setFlyToView(true);

    ge.getFeatures().appendChild(networkLink);
}

function failureCB(errorCode) {
}