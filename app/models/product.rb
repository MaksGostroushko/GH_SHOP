class Product < ApplicationRecord

  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :comments, dependent: :destroy
  has_many :line_items
  has_many :categories
  has_many :order_items

  scope :published, -> { where(published: true) }
  default_scope { where(active: true) }


  mount_uploaders :pictures, PictureUploader

  def self.search(search)
    where("title ILIKE ?", "%#{search}%")
  end

  # scope :published, -> { where(published: true) }


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
