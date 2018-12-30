class Comment < ApplicationRecord

  belongs_to :product

  validates :body, presence: true, length: { maximum: 300 }
  # default_scope { order(created_at: asc)}
end
