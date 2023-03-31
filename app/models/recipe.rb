class Recipe < ApplicationRecord
  
  has_one_attached :image
  has_one_attached :video
  
  validates :ingredient, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :star, presence: true
  validates :time, presence: true
  validates :price, presence: true
  validates :procedure, presence: true
  validates :point, presence: true
  
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre
  belongs_to :user
  
   def favorited_by?(user)
    favorites.exists?(user_id: user.id)
   end
  
end
