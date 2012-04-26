class Ethos < ActiveRecord::Base
  attr_accessible :description, :headline, :ordinal, :image
  mount_uploader :image, EthosImageUploader
  def to_s
    headline
  end
end
