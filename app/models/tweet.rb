class Tweet < ActiveRecord::Base
  attr_accessible :body, :id, :media, :posted_at

  def to_s
    body
  end
end
