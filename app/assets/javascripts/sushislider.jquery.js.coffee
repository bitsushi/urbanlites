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


jQuery ->

  $('#sushislider ul li.item:gt(0)').hide()
  # setInterval (-> next()), 1000

  $('#sushislider #next').click (e) ->
    e.preventDefault()
    next()

  $('#sushislider #previous').click (e) ->
    e.preventDefault()
    next()

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