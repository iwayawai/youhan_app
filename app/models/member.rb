class Member < ApplicationRecord

  has_one_attached :image

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
