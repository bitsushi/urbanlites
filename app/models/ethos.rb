class Ethos < ActiveRecord::Base
  attr_accessible :description, :headline, :ordinal, :image
  mount_uploader :image, EthosImageUploader
  validates_presence_of :headline, :description
  default_scope order('ordinal ASC')
  def to_s
    headline
  end
end
