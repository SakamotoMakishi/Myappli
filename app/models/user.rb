class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :books #アバター画像の登録
  has_one_attached :avatar
  mount_uploader :image, ImageUploader
  validates :email, presence: true
end
