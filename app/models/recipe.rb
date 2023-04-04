class Recipe < ApplicationRecord

  has_one_attached :image
  has_one_attached :video

  validates :name, presence: true, length: { maximum: 30 }
  validates :star, presence: { message: "を選んでください" }
  validates :genre, presence: { message: "を選んでください" }
  validates :introduction, presence: true, length: { maximum: 100 }
  validates :time, presence: true
  validates :price, presence: true
  validates :ingredient, presence: true
  validates :procedure, presence: true
  validates :point, presence: true, length: { maximum: 50 }
  validates :required_either_image_or_video, presence: true

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre
  belongs_to :user


   def favorited_by?(user)
     favorites.exists?(user_id: user.id)
   end
   
   def required_either_image_or_video
     return if image.present? ^ video.present?

     errors.add(:base, '画像または動画のどちらか一方を投稿してください')
   end
       
end

