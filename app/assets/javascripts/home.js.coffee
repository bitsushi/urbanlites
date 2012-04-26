jQuery ->
  # $(".tweet").tweet
  #   username: "bitsushi"
  #   join_text: null
  #   avatar_size: 32
  #   count: 1
  #   loading_text: "loading tweets..."
  #   template: "<div class='tweet_body'>{text}</div><div class='tweet_time'>{time}</div>"
  $('#my-slideshow').bjqs
    width: '100%'
    height: 430
    # height : 600
    showMarkers: true
    showControls: true
    centerMarkers: false
    animation: 'fade'

  $('#ident').click ->
    window.location = $(this).data('url')

  $('#c-pages-a-home #window_container li.bjqs-slide').click ->
    window.location = $(this).data('url')
