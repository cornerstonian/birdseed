class UsersController < ApplicationController

  before_action except: [:new, :create] do
      if @current_user.nil?
        redirect_to sign_in_path, alert: "Sign in to post an update"
      end
    end

    def index
      @users = User.all
    end

    def show
      @user = User.find_by(id: params[:id])
    end


    def new
      @user = User.new
    end

    def create
      @user = User.new
      @user.username = params[:user][:username]
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Thanks for joining, #{@user.username}!"
      else
        render :new
      end
    end

    def following
      @users = @current_user.following_users
    end

    def follow
      user = User.find_by! id: params[:user_id]
      @current_user.follow(user)
      redirect_to users_path, notice: "⏩"
    end

    def unfollow
      user = User.find_by! id: params[:user_id]
      @current_user.stop_following(user)
      redirect_to users_path, notice: "🏃💨"
    end

end
