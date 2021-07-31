class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :favorites, dependent: :destroy

  def has_favorited?(post)
    post.favorites.where(user_id: id).any?
  end


  has_many :friendships, dependent: :destroy



end
