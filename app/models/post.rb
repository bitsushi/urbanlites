class Post < ActiveRecord::Base
  # attr_accessible :content, :posted_at, :type, :url

  validates_presence_of :posted_at, :type, :content, :service_id

  default_scope order('posted_at DESC')

  def to_s
    content
  end
end
