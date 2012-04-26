class ActivityController < ApplicationController
  def index
    @posts = TwitterPost.limit(10)
  end
end
