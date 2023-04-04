class Recipe < ApplicationRecord

  has_one_attached :image
  has_one_attached :video

  validates :name, presence: true, length: { maximum: 30 }
  validates :star, presence: { message: "を選んでください" }
  validates :genre, presence: { message: "を選んでください" }
  validates :image, presence: { message: "か動画を投稿してください" }
  validates :introduction, presence: true, length: { maximum: 100 }
  validates :time, presence: true
  validates :price, presence: true
  validates :ingredient, presence: true
  validates :procedure, presence: true
  validates :point, presence: true, length: { maximum: 50 }

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre
  belongs_to :user

   def favorited_by?(user)
     favorites.exists?(user_id: user.id)
   end

end
