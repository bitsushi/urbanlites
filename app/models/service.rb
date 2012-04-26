class Service < ActiveRecord::Base

  validates_presence_of :name, :description
  mount_uploader :image, ServiceImageUploader
  default_scope order('ordinal ASC')

  def to_s
    name
  end
end
