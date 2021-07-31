class Posts::FavoritesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post

  def create
    #check if it exists
    favorite = @post.favorites.where(user_id: current_user.id)
    if not favorite.present?
      favorite = @post.favorites.new(favorite_params)
      favorite.user_id = current_user.id
    else
      return
    end
    respond_to do |format|
      if favorite.save
        format.html { redirect_to @post, notice: "Favorited!" }
        format.js
      else
        format.html { redirect_to @post, notice: "Can't favorite for some reason!"} # @favorite }
        format.js
      end
    end
  end

    def destroy
      favorite = @post.favorites.where(user_id: current_user.id).destroy_all
      respond_to do |format|
        format.html { redirect_to @post, notice: "Unfavorited!" }
        format.js
      end
    end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def favorite_params
      params.permit(:user_id, :post_id)
    end

end
