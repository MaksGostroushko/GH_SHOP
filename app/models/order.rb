class Order < ActiveRecord::Base
  enum order_status: {
    in_progress: 'In Progress',
    placed: 'Placed',
    shipped: 'Shipped',
    cancelled: 'Cancelled'
  }

  has_many :order_items, dependent: :destroy
  has_many :products, dependent: :destroy
  before_save :update_subtotal
  before_create :set_status


  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
private

def set_status
  self.order_status = :in_progress
end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
