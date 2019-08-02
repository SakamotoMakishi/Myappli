class Book < ApplicationRecord
  has_many :reviews#,foreign_key: "fromid"
  belongs_to :user#,foreign_key: "fromid"
  #has_and_belongs_to_many :users
  mount_uploader :image, ImageUploader
end
