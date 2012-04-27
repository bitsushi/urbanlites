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
    $('#thumb_cropbox').Jcrop
      aspectRatio: 1
      onSelect: @updateThumb
      onUpdate: @updateThumb
      # setSelect: [50,50,150,150]

    $('#window_cropbox').Jcrop
      aspectRatio: 880/420
      onSelect: @updateWindow
      onUpdate: @updateWindow

    #   return false
    #

  updateThumb: (coords) =>
    type = 'thumb'
    $("#photo_#{type}_crop_x").val(coords.x)
    $("#photo_#{type}_crop_y").val(coords.y)
    $("#photo_#{type}_crop_w").val(coords.w)
    $("#photo_#{type}_crop_h").val(coords.h)
    # @updatePreview(coords)

  updateWindow: (coords) =>
    type = 'window'
    $("#photo_#{type}_crop_x").val(coords.x)
    $("#photo_#{type}_crop_y").val(coords.y)
    $("#photo_#{type}_crop_w").val(coords.w)
    $("#photo_#{type}_crop_h").val(coords.h)
    # @updatePreview(coords)

# updatePreview: (coords) =>
#   $('#preview').css
#     width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
#     height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'
#     marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
#     marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'