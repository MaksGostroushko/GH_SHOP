class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :order_items

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :result, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  scope :published, -> { where(published: true) }
  default_scope { where(active: true) }


  mount_uploaders :pictures, PictureUploader

  def self.search(search)
    where("title ILIKE ?", "%#{search}%")
  end

  def to_param
    "#{id}-#{title.parameterize.downcase}"
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
