class FacebookPost < ActiveRecord::Base
  # attr_accessible :content, :posted_at, :uid, :url
  default_scope order('posted_at DESC')
end
