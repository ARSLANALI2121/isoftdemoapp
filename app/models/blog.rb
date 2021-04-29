class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_one_attached :image


end
