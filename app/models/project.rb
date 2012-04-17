class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :window, where('window_ordinal > 0').order('window_ordinal ASC')
  default_scope order('ordinal ASC')

  validates_uniqueness_of :name, :slug
  validates_presence_of :name, :who, :where, :what

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

  def to_s
    name
  end

end
