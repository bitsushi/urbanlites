jQuery ->
  $('body#c-downloads-a-index li.download').click ->
    window.location = $(this).data('url');
    # window.open($(this).data('url'),'_newtab');