class Product < ApplicationRecord

  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :comments, dependent: :destroy
  has_many :line_items

  mount_uploaders :pictures, PictureUploader

  def self.search(search)
    where("title ILIKE ?", "%#{search}%")
  end

  private

  def unsure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      flash[:danger] = "Item exist"
      return false
    end
  end
end
