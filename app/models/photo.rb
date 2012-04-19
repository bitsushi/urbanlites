class Photo < ActiveRecord::Base
  belongs_to :project
  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h, :crop_thumb, :crop_window
  after_update :crop_image

  include Rails.application.routes.url_helpers
  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.thumb.url,
      "delete_url" => photo_path(:id => id),
      "delete_type" => "DELETE"
    }
  end

  def crop_image
    image.recreate_versions! if crop_thumb.present?
    image.recreate_versions! if crop_window.present?
  end

end
