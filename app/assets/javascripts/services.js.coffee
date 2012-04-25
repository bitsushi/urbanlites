jQuery ->
  $('ul#services li div.description').hide()

  $('ul#services li').hover(
    ->
      $(this).find('div.description').fadeIn()
    ->
      $(this).find('div.description').stop().fadeOut()
  )