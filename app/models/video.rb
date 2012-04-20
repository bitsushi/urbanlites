class Video < ActiveRecord::Base
  attr_accessible :description, :duration, :height, :name, :project_id, :published_at, :state, :uid, :width
  belongs_to :project

  def to_s
    name
  end
end
