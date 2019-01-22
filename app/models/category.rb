class Category < ApplicationRecord
  has_many :product_categories, dependent: :nullify
  has_many :products, through: :product_categories
end
