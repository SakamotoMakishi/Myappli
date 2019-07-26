class Book < ApplicationRecord
  has_many :reviews#,foreign_key: "fromid"
  belongs_to :user#,foreign_key: "fromid"
  mount_uploader :image, ImageUploader
end
