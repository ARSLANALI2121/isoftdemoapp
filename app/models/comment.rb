class Comment < ApplicationRecord
  mount_uploader :images, AvatarUploader
  belongs_to :blog
  belongs_to :user
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy 

end
