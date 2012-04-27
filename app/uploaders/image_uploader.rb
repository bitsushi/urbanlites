# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :large do
    resize_to_limit(1200, 1200)
  end

  version :thumb do
    process :crop_thumb
    resize_to_fill(100,100)
  end

  version :window do
    process :crop_window
    resize_to_fill(880,420)
  end

  def crop_thumb
    if model.thumb_crop_x.present?
    resize_to_limit(1200, 1200)
    manipulate! do |img|
      x = model.thumb_crop_x.to_i
      y = model.thumb_crop_y.to_i
      w = model.thumb_crop_w.to_i
      h = model.thumb_crop_h.to_i
      img.crop!(x,y,w,h)
    end
    end
  end

  def crop_window
    if model.window_crop_x.present?
    resize_to_limit(1200, 1200)
    manipulate! do |img|
      x = model.window_crop_x.to_i
      y = model.window_crop_y.to_i
      w = model.window_crop_w.to_i
      h = model.window_crop_h.to_i
      img.crop!(x,y,w,h)
    end
  end
  end

end