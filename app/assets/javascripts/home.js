var shareLoc = shareLoc || {};

shareLoc = {
  initMap: function(){
    $.getJSON('/', function(data){
      var center = data[0].coordinate || [0, 0];
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
  }
}

$(function(){
  $('[data-toggle="popover"]').popover();
})

shareLoc.initMap();
  
