class Friendship < ApplicationRecord
  has_many :users

  def self.has_friended?(user_id, friend_id)
    friendship = Friendship.where(user_id: user_id, friend_id: friend_id)
    if not friendship.present?
      return false
    else
      return true
    end
  end

end
