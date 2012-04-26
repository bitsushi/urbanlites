#http://www.kevinleary.net/jquery-fadein-fadeout-problems-in-internet-explorer/
jQuery ->
  $('ul#services li div.description').hide()

  $('ul#services li').hover(
    ->
      $(this).find('div.description').fadeIn(200, -> this.style.removeAttribute('filter'); )
    ->
      $(this).find('div.description').stop().fadeOut()
  )