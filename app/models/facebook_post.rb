class FacebookPost < ActiveRecord::Base
  attr_accessible :content, :posted_at, :uid, :url
end
