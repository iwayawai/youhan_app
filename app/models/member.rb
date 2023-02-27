class Member < ApplicationRecord
  
  has_one_attached :image
  
  has_many :recipes, :comments, :favorites, dependent: :destroy
  
end
