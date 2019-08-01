class Review < ApplicationRecord
  belongs_to :book  #所属するモデル名
  belongs_to :user
  has_one_attached :avatar
end
