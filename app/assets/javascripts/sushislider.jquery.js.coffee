# http://snook.ca/archives/javascript/simplest-jquery-slideshow

setActive = ->

  $('#sushislider ul').append( $('#sushislider li:first') )

  # if window.current is window.slider_length - 1
  #   window.current = 0
  # else
  #   window.current++
  #
  # $("#sushislider .item:eq(#{window.current})").append($('#player'))

  # $('#sushislider .item').hide()
  # $("#sushislider .item:eq(#{window.current})").show()
  # if $("#sushislider .item:eq(#{window.current})").data('youtube-id')
  #   window.player.cueVideoById( $("#sushislider .item:eq(#{window.current})").data('youtube-id') )
  #   $('#player').show()
  # else
  #   $('#player').hide()

next = ->
  incoming = $('#sushislider ul li.item:eq(1)')


  if incoming.data('youtube-id')
    $('#player_container').show()
  else
    $('#player_container').hide()

  $('#sushislider ul li.item:first').fadeOut().appendTo('#sushislider ul')
  incoming.fadeIn()
  startTimer()

  # $('#sushislider ul li.item:first').fadeOut().next('li').fadeIn().end().appendTo('#sushislider ul')
  # if $("#sushislider ul li.item:first").data('youtube-id')
  #   window.player.cueVideoById( $("#sushislider .item:eq(#{window.current})").data('youtube-id') )
  #   $('#player').show()
  # else
  #   $('#player').hide()

prev = ->
  incoming = $('#sushislider ul li.item:last')
  $('#player').appendTo(incoming)
  $('#sushislider ul li.item:first').fadeOut()
  incoming.fadeIn().prependTo('#sushislider ul')
  startTimer()

startTimer = ->
  clearInterval window.interval
  window.interval = setInterval (-> next()), 3000

  index = $('#sushislider li.item:first').data('index')
  $('#sushislider ol li').removeClass('active')
  $("#sushislider ol li:eq(#{index})").addClass('active')

jQuery ->

  $('#sushislider ul li.item:gt(0)').hide()

  $('#sushislider').swipeEvents()
    .bind("swipeLeft",  -> $('#sushislider #next').trigger('click') )
    .bind("swipeRight",  -> $('#sushislider #previous').trigger('click') )

  startTimer()


  $('#sushislider').hover(->
    clearInterval window.interval
  ,->
    startTimer()
  )


  $('#sushislider #next').click (e) ->
    e.preventDefault()
    next()

  $('#sushislider #previous').click (e) ->
    e.preventDefault()
    prev()

  # # window.current = -1
  # # setTimeout (-> setActive() ), 1000
  #
  # # $('#sushislider #next').trigger('click')
  #
  # $('#sushislider').each ->
  #
  #   window.slider_length = $('#sushislider .item').length
  #   console.log window.slider_length
  #
  #   # $(this).find('.item:first').addClass('inactive')
  #   # tog $(this).find('.item:first')
  #   #
  #   # $(this).find('.item:not(:first)').addClass('active')
  #   # tog $(this).find('.item:not(:first)')
  #
  #   $(this).find('#next').click (e) ->
  #     e.preventDefault()
  #     $('#sushislider ul').append( $('#sushislider li:first') )
  #     # # console.log window.player
  #     # id = $('#sushislider').find('.item:first').data('youtube-id')
  #     # console.log id
  #     #
  #  $(this).find('#previous').click (e) ->
  #     e.preventDefault()
  #     $('#sushislider ul').prepend( $('#sushislider li:last') )