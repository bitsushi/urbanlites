class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :videos
  has_many :photos
end
