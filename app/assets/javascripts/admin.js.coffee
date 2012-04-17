jQuery ->
  $("#multi").bsmSelect
    plugins: [ $.bsmSelect.plugins.sortable() ]

  $('select').change (e,data) ->
    $('#save_window_ordinals').attr('disabled',null)
    console.log data
    # console.log($('select').extractLabel)

  $('form#update_frontpage_items').submit ->
    $('#save_window_ordinals').attr('disabled',true)
    # return false

  $('table.sortable').sortable
    axis: 'y'
    forceHelperSize: true
    items: 'tr'
