class PostsController < ApplicationController

  before_action do
    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please sign if if you'd like to Post"
    end
  end

  def index
  @posts = @current_user.timeline
  end


  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.body = params[:post][:body]
    @post.user = @current_user

    if @post.save
      redirect_to root_path, notice: "Quack!"
    else
      render :new
    end
  end

end
