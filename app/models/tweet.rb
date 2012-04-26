class Tweet < ActiveRecord::Base
  attr_accessible :body, :id, :media, :posted_at
end
