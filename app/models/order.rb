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

  after_update :send_mail_to_user, :send_mail_to_admin

  def send_mail_to_admin
    OrderMailer.send_mail_to_admin(self).deliver_now!
  end

  def send_mail_to_user
    OrderMailer.send_mail_to_user(self).deliver_now!
  end

  private

  def set_status
    self.order_status = :in_progress
  end
end
