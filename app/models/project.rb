class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :photos
  has_many :videos

  accepts_nested_attributes_for :photos,
    :allow_destroy => true,
    :reject_if => proc { |attributes| attributes['image'].blank? }

  accepts_nested_attributes_for :videos,
    :allow_destroy => true,
    :reject_if => proc { |attributes| attributes['url'].blank? }

  def primary_photo
    photos[0]
  end

end
