class OrderMailer < ApplicationMailer

  def send_mail_to_user(order)
    @order = order
    mail(to: @order.email, subject: 'Order')
  end

  def send_mail_to_admin(order)
    @order = order
    mail(to: 'makshostroyshko@gmail.com', subject: 'Order')
  end
end
