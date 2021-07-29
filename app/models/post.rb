class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :user, presence: true
  validates_length_of :content, :maximum => 500, :minimum => 1
  validates_length_of :title, :maximum => 100, :minimum => 1

end
