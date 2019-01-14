class Order < ActiveRecord::Base
  enum order_status: {
    in_progress: 'In Progress',
    placed: 'Placed',
    shipped: 'Shipped',
    cancelled: 'Cancelled'
  }

  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  before_create :set_status

  private

  def set_status
    self.order_status = :in_progress
  end
end
