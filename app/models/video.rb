class Video < ActiveRecord::Base
  attr_accessible :description, :duration, :height, :name, :project_id, :published_at, :state, :uid, :width
  belongs_to :project

  def to_s
    name
  end

  # def to_s
  #   "<iframe width='374' height='210' src='http://www.youtube.com/embed/#{self.service_id}' frameborder='0' allowfullscreen></iframe>".html_safe
  # end
end
