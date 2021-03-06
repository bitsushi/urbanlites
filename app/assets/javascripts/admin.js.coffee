jQuery ->

  $('form').on 'click', '.remove_fields', (event) ->
      $(this).prev('input[type=hidden]').val('1')
      $(this).closest('fieldset').hide()
      event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $("#multi").bsmSelect
    plugins: [ $.bsmSelect.plugins.sortable() ]

  # $('fieldset.quote a.delete').click (e) ->
  #   e.preventDefault()
  #   $(this).parent('fieldset').hide()
  #   $(this).parent('fieldset').find('.delete_checkbox').val(true)

  $('select').change (e,data) ->
    $('#save_window_ordinals').attr('disabled',null)
    # console.log data
    # console.log($('select').extractLabel)

  $('#videos select#multi').change ->
    $.post $('#videos').data('update-url'), $(this).serialize()
    # $('form#update_frontpage_items').submit()

  $('form#update_frontpage_items select#multi').change ->
    $('form#update_frontpage_items').submit()
    # $('#save_window_ordinals').attr('disabled',true)
    # return false

  $('table.sortable').sortable
    axis: 'y'
    forceHelperSize: true
    items: 'tr'
    handle: 'td.move'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))

  $('ul.sortable').sortable
    forceHelperSize: true
    items: 'li'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))



  # $('#fileupload').fileupload()
  # dataType: 'json'
  # done: (e, data) ->
  #   alert 'a'
  #   $.each data.result, (index, file) ->
  #     $('<p/>').text(file.name).appendTo(document.body)


  $("#fileupload").fileupload()
  $.getJSON $("#fileupload").prop("action"), (files) ->
    fu = $("#fileupload").data("fileupload")
    template = undefined
    fu._adjustMaxNumberOfFiles -files.length
    template = fu._renderDownload(files).appendTo($("#fileupload .files"))
    fu._reflow = fu._transition and template.length and template[0].offsetWidth
    template.addClass "in"
    $("#loading").remove()

  $('#photo_uploads input').change ->
    for file in this.files
      imageType = /image.*/;
      return false unless file.type.match(imageType)
      img = document.createElement("img");
      # img.classList.add("obj");
      img.file = file;

      reader = new FileReader()
      reader.onload = ((aImg) ->
        (e) ->
          aImg.src = e.target.result
      )(img)
      reader.readAsDataURL file

      $(this).next('.upload_preview').append(img)

