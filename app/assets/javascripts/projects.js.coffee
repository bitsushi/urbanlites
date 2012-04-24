jQuery ->
  $('a[title]').qtip();

  $('#window_container').swipeEvents()
    .bind("swipeLeft",  -> $('a.bjqs-prev').trigger('click') )
    .bind("swipeRight",  -> $('a.bjqs-next').trigger('click') )

  $('body#c-projects-a-index .project').click ->
    window.location = $(this).data('url')

  $('#add_video').click ->
    embed_code = $('#video_url').val().replace(/^[^v]+v.(.{11}).*/,"$1")
    $('#video_url').val('').focus()
    player = "<iframe width='280' height='156' src='http://www.youtube.com/embed/#{embed_code}' frameborder='0' allowfullscreen></iframe>"
    $('#video_list').append("<li>#{player}</li>")
    return false

  if window.thumbs
    $('ol.bjqs-markers li').each ->
      $(this).html( "<img src='#{window.thumbs.shift()}' width='100' height='100' />" )
