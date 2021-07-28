class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :user, presence: true

end
