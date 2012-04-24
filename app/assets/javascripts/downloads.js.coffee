jQuery ->
  $('body#c-downloads-a-index li.download').click ->
    window.open($(this).data('url'),'_newtab');