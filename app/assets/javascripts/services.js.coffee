#http://www.kevinleary.net/jquery-fadein-fadeout-problems-in-internet-explorer/
jQuery ->
  $('html.no-touch #c-services-a-index ul#services li div.description').hide()

  $('html.no-touch #c-services-a-index ul#services li').each ->

    $(this).hover(
      ->
        $(this).find('div.description').fadeIn(200, -> this.style.removeAttribute('filter'); )
      ->
        $(this).find('div.description').clearQueue().stop().fadeOut()
    )