class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_order
  before_action :get_pages, :get_settings

  def current_order
    Order.find_or_initialize_by(id: session[:order_id])
  end

  private

  def get_pages
    @pages = SitePage.all
  end

  def get_settings
    @settings = ProjectSetting.all
  end
end
