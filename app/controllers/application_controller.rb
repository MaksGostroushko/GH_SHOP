class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_order
  before_action :get_pages, :get_settings

  def current_order
    # if session[:order_id].present?
    #   Order.find(session[:order_id])
    # else
    #   Order.new
    # end

    Order.first_or_initialize(id: session[:order_id])
  end

  private

  def get_pages
    @pages = SitePage.all
  end

  def get_settings
    @settings = ProjectSetting.all
  end
end
