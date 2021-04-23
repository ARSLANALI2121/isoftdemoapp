class Comment < ApplicationRecord
  belongs_to :blog
  has_many :pictures, as: :imageable
  has_many :likes, as: :likeable, dependent: :destroy
end
