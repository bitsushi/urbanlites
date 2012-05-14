class Tweet < ActiveRecord::Base
  # attr_accessible :body, :id, :media, :posted_at
  default_scope order('posted_at DESC')

  def to_s
    body
  end

  def url
    "http://twitter.com/#!/urbanlites/status/#{uid}"
  end

end
