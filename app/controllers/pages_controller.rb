class PagesController < ApplicationController

  def show
    @page = SitePage.find(params[:id])
  end
end

  
