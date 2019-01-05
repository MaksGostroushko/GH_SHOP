class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.build(order_item_params)
    @order.save!
    # debugger
    session[:order_id] = @order.id
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
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :product_title, :product_image, :product_description, :product_result)
  end
end
