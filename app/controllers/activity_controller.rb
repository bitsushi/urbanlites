class ActivityController < ApplicationController
  def index
    @tweets = Tweet.limit(10)
    @videos = Video.limit(3)
  end
end
