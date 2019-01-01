      var datos;
      $.ajax({
          url: 'eventos.json',
          dataType: 'json',
          async: false,
          success: function(data) {
              datos = data;
          }
      });

      
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 9.948440 , lng: -84.143611 },
          zoom: 8
        });
       

        for (var i = datos.eventos.length - 1; i >= 0; i--) {

            var position = {lat: parseFloat(datos.eventos[i].latitud) , lng: parseFloat(datos.eventos[i].longuitud) };
      
            var contentString = '<div id="content">'+
            '<div id="siteNotice">'+
            '</div>'+
            '<h1 id="firstHeading" class="firstHeading">'+datos.eventos[i].nombre+'</h1>'+
            '<div id="bodyContent">'+
            '<p><b>Fecha: </b>'+datos.eventos[i].fechaHora+'</p>'+
            '<p><b>Ubicación: </b>'+datos.eventos[i].ubicacion+'</p>'+
            '<p><b>Descripción: </b>'+datos.eventos[i].descripcion+'</p>'+
            '</div>'+
            '</div>';

        var infowindow = new google.maps.InfoWindow({
          content: contentString
        });

        var marker = new google.maps.Marker({position: position, map: map, title: datos.eventos[i].nombre, icon: '/assets/marker.png'});

        marker.addListener('click', function() {
          infowindow.open(map, marker);
        });
  
         }
      
      }
