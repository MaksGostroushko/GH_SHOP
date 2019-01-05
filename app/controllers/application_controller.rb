class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    # if session[:order_id].present?
    #   Order.find(session[:order_id])
    # else
    #   Order.new
    # end

    Order.first_or_initialize(id: session[:order_id])
  end
end
