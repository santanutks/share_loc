var shareLoc = shareLoc || {};

shareLoc = {
  initMap: function(){
    var json_path = $('#map').data('json-url');
    $.getJSON(json_path, function(data){
      var center = data[0] ? data[0].coordinate : [0, 0];
      var map = new ol.Map({
        target: 'map',
        layers: [
          new ol.layer.Tile({
            source: new ol.source.MapQuest({layer: 'sat'})
          })
        ],
        view: new ol.View({
          center: ol.proj.fromLonLat(center),
        zoom: 4
        })
      });
    
      $.each(data, function(){
        var element = $('.marker').clone();
        element.removeClass('hidden').attr({'data-content': this.address, 'data-toggle': 'popover'});
        map.addOverlay(new ol.Overlay({
          position: ol.proj.transform(
            this.coordinate,
            'EPSG:4326',
            'EPSG:3857'
          ),
          element: element[0]
        }));
      });
    });
    
    setTimeout(function(){
      $('[data-toggle="popover"]').popover();
    }, 300);
  }
}

shareLoc.initMap();
  
