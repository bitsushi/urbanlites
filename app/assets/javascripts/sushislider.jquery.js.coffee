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

next = (num=1) ->
  # incoming = $("#sushislider ul li.item:eq(#{num})")

  $('#sushislider ul li.item:first').stop().fadeOut()
  while num-- > 0
    $('#sushislider ul li.item:first').appendTo('#sushislider ul')

  if $('#sushislider ul li.item:first').data('youtube-id') then $('#player_container').show() else $('#player_container').hide()
  $('#sushislider ul li.item:first').fadeIn()
  startTimer()

  # $('#sushislider ul li.item:first').fadeOut().next('li').fadeIn().end().appendTo('#sushislider ul')
  # if $("#sushislider ul li.item:first").data('youtube-id')
  #   window.player.cueVideoById( $("#sushislider .item:eq(#{window.current})").data('youtube-id') )
  #   $('#player').show()
  # else
  #   $('#player').hide()

prev = (num=1) ->
  # incoming = $('#sushislider ul li.item:last')
  # $('#player').appendTo( $('#sushislider ul li.item:last') )

  $('#sushislider ul li.item:first').stop().fadeOut()
  while num-- > 0
    $('#sushislider ul li.item:last').prependTo('#sushislider ul')

  if $('#sushislider ul li.item:first').data('youtube-id') then $('#player_container').show() else $('#player_container').hide()

  $('#sushislider ul li.item:first').fadeIn()
  startTimer()

startTimer = ->
  clearInterval window.interval
  window.interval = setInterval (-> next()), 3000

  index = $('#sushislider li.item:first').data('index')
  $('#sushislider ol li').removeClass('active')
  $("#sushislider ol li:eq(#{index})").addClass('active')

jQuery ->

  $(document).keyup (event) ->
    switch event.which
      when 39 then next()
      when 37 then prev()

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

  $('#sushislider ol li').click (e) ->
    e.preventDefault()
    current = parseInt $('#sushislider ul li.item:first').data('index')
    thisNum = parseInt $(this).index()
    diff = thisNum - current
    counter = 0
    # while counter++ < Math.abs(diff)
    if diff > 0 then next( diff ) else prev( Math.abs(diff) )
