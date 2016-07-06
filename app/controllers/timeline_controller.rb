class TimelineController < ApplicationController
  def index
    @posts = Post.all
  end
end
