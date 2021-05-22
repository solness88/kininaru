class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  before_validation { email.downcase! }
  has_secure_password
  mount_uploader :image, ImageUploader
  has_many :news, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_news, through: :favorites, source: :new
  def favorited_by?(new_id)
    favorites.where(new_id: new_id).exists?
  end
end
