showPreview = (coords) ->
  # console.log coords
	rx = 100 / coords.w;
	ry = 100 / coords.h;
	$('#preview').css
		width: Math.round(rx * 500) + 'px'
		height: Math.round(ry * 370) + 'px'
		marginLeft: '-' + Math.round(rx * coords.x) + 'px'
		marginTop: '-' + Math.round(ry * coords.y) + 'px'

jQuery ->
  new ImageCropper()


class ImageCropper
  constructor: ->
    $('#edit_thumb').click =>
      $('#photo_crop_thumb').val(1)
      $('#photo_crop_window').val(null)
      $('#cropbox').Jcrop
        aspectRatio: 1
        onSelect: @update
        onUpdate: @update
        # setSelect: [50,50,150,150]

    $('#edit_window').click =>
      $('#photo_crop_window').val(1)
      $('#photo_crop_thumb').val(null)
      $('#cropbox').Jcrop
        aspectRatio: 800/400
        onSelect: @update
        onUpdate: @update

    return false

  update: (coords) =>
    $('#photo_crop_x').val(coords.x)
    $('#photo_crop_y').val(coords.y)
    $('#photo_crop_w').val(coords.w)
    $('#photo_crop_h').val(coords.h)
    # @updatePreview(coords)

# updatePreview: (coords) =>
#   $('#preview').css
#     width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
#     height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'
#     marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
#     marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'