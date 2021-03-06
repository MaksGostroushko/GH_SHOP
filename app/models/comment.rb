class Comment < ApplicationRecord

  belongs_to :product

  validates :body, presence: true, length: { minimum: 5, maximum: 300 }
  validates :name, presence: true, length: { minimum: 3, maximum: 40 }
end
