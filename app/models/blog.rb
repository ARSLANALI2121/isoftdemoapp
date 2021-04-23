class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :pictures, as: :imageable
  has_many :likes, as: :likeable, dependent: :destroy

  # has_one_attached :image, variant: {
  #   thumb: { resize: "100x100" }
  # }

  has_one_attached :image
  # , variants: {
  #       thumb: { resize: "100x100" },
  #       medium: { resize: "300x300", monochrome: true }
  #     }

  # has_one_attached :image do |blob|
  #   blob.variant  :thumb, resize: "100x100"
  #   blob.variant :medium, resize: "300x300", monochrome: true
  # end


end
