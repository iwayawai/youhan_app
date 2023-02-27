class Recipe < ApplicationRecord
  
  has_one_attached :image
  has_one_attached :video
  
  has_many :comments, :favorites, :ingredients, dependent: :destroy
  belongs_to :genre, :member
  
end
