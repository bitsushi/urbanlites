jQuery ->
  if $('#map_canvas').length
    myLatlng = new google.maps.LatLng(53.472169,-2.181558);
    myOptions = {
      zoom: 15
      center: myLatlng
      mapTypeId: google.maps.MapTypeId.ROADMAP
      mapTypeControl: false
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)

    marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title:"Hello World!"
    })