class Recipe < ApplicationRecord
  
  has_one_attached :image
  has_one_attached :video
  
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  belongs_to :genre
  belongs_to :member
  
end
