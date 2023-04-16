class Genre < ApplicationRecord
  
  has_many :recipes, dependent: :destroy
  
  validates :genre, presence: true
  
end
