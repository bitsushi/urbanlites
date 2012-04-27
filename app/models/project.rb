class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :quotes

  def thumbnail
    photos.first.image_url(:thumb) unless photos.empty?
  end

  def frontpage_image
    photos.first.image_url(:window) unless photos.empty?
  end

  def previous
    Project.find_by_id(id - 1, :select => 'name,slug')
  end

  def next
    Project.find_by_id(id + 1, :select => 'name,slug')
  end

  scope :window, where('window_ordinal > 0').order('window_ordinal ASC')

  validates_uniqueness_of :name, :slug
  validates_presence_of :name, :who, :where, :what

  has_many :photos
  has_many :videos

  accepts_nested_attributes_for :quotes,
    :allow_destroy => true,
    :reject_if => proc { |attributes| attributes['body'].blank? }

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
