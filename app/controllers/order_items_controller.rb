class OrderItemsController < ApplicationController
  def create
    @order = current_order
    if @order_item = @order.order_items.find_by(product_id: params[:order_item][:product_id].to_i)
      @order_item.quantity += params[:order_item][:quantity].present? ? params[:order_item][:quantity].to_i : 1
      @order_item.save
    else
      @order_item = @order.order_items.build(order_item_params)
      @order.save!
      flash[:success] = "Item added in cart"
      session[:order_id] = @order.id
    end
    redirect_back(fallback_location: root_path)
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    redirect_back(fallback_location: cart_path)
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id]).destroy!
    @order_items = @order.order_items
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :product_title, :product_image, :product_description, :product_result)
  end
end
