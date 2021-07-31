class UsersController < ApplicationController

  def index
    @users = User.paginate(:page => params[:page], per_page:8)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page], per_page:8)
  end

end
