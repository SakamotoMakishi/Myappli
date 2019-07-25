class Book < ApplicationRecord
  has_many :reviews
  belongs_to :user
  mount_uploader :image, ImageUploader
end
