class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    # @order.add_order_from_cart(@cart)

    if @order.save
      redirect_to @order
      flash[:success] = 'Your order was created. We call you'
    else
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :phone, :comment)
  end
end
