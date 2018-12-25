class Product < ApplicationRecord

  has_many :product_categories
  has_many :categories, through: :product_categories

  mount_uploader :picture, PictureUploader

  def self.search(search)
    where("title ILIKE ?", "%#{search}%")
  end
end
