class ActivityController < ApplicationController
  def index
    @posts = Post.limit(10)
  end
end
