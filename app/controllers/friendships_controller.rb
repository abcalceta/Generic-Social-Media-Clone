class FriendshipsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_friendA
  before_action :set_friendB

  def create
    if Friendship.where(user_id: @friendA, friend_id: @friendB)?
      return
    else
      friendship = Friendship.create(friendship_params)
      respond_to do |format|
        format.html { redirect_to user_path(@friendB), notice: "Friended!" }
        # format.js
      end
    end
  end

  def destroy
    #check if it exists already
    friendship = Friendship.where(user_id: @friendB, friend_id: @friendA).destroy_all
    friendship = Friendship.where(user_id: @friendA, friend_id: @friendB).destroy_all

    respond_to do |format|
      format.html { redirect_to user_path(@friendB), notice: "Unfriended!" }
      # format.js
    end
  end

  private
    def set_friendA
      @friendA = User.find(params[:user_id])
    end
    def set_friendB
      @friendB = User.find(params[:friend_id])
    end
    def friendship_params
      params.permit(:user_id, :friend_id)
    end


end
