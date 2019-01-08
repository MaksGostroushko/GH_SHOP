class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def order_details; end

  def update_order_details
    @order = current_order
    if @order.update!(order_params)
      session.delete(:order_id)
      OrderMailer.send_mail_to_user(@order).deliver_now
      OrderMailer.send_mail_to_admin(@order).deliver_now
      redirect_to @order
    else
      render :order_details
    end
  end

  private

  def order_params
    params.permit(:name, :email, :phone, :comment)
  end
end
