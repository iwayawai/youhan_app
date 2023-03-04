class Recipe < ApplicationRecord
  
  has_one_attached :image
  has_one_attached :video
  
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre
  belongs_to :user
  
   def favorited_by?(user)
    favorites.exists?(user_id: user.id)
   end
  
end
