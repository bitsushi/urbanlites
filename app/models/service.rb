class Service < ActiveRecord::Base

  validates_presence_of :name, :description
  mount_uploader :image, ServiceImageUploader
  def to_s
    name
  end
end
