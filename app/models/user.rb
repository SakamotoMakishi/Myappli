class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :books
  has_many :reviews
  has_one_attached :avatar #アバター画像の登録
  #has_and_belongs_to_many :books
  mount_uploader :image, ImageUploader
  validates :email, presence: true
end
