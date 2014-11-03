var ContactUs = function () {

  return {
    //main function to initiate the module
    init: function () {
  		var map;
  		$(document).ready(function(){
  		  map = new GMaps({
  			div: '#map',
        lat: 49.728840,
  			lng: 6.614080,
  		  });
        var marker = map.addMarker({
          lat: 49.728840,
          lng: 6.614080,
          title: 'OPC® cardsystems GmbH',
          infoWindow: {
            content: "<b>OPC® cardsystems GmbH.</b> Diedenhofener Str. 22<br>D-54294 Trier"
          }
          });

  		   marker.infoWindow.open(map, marker);
  		});
    }
  };

}();